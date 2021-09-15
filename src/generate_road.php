<?php

const COLOUR_RED = 2;
const COLOUR_WHITE = 15;
const COLOUR_GREY = 5;
const COLOUR_BROWN = 8;

const COLOUR_ASPHALT = 0;
const COLOUR_GRASS_1 = 11;
const COLOUR_GRASS_2 = 12;
const COLOUR_YELLOW = 6;

function convertPixelColourArrayToPlanarArray($pixel_colours) {
    $bitplanes = [
        [],
        [],
        [],
        []
    ];

    foreach ($pixel_colours as $pixel_colour) {
        $bitplanes[3][] = ($pixel_colour & 8) ? 1: 0;
        $bitplanes[2][] = ($pixel_colour & 4) ? 1: 0;
        $bitplanes[1][] = ($pixel_colour & 2) ? 1: 0;
        $bitplanes[0][] = ($pixel_colour & 1) ? 1: 0;
    }

    foreach ($bitplanes as $index => $bitplane) {
        $bitplaneBinary = implode('', array_slice($bitplane, 0, 8));
        $planar_pixels[] = bindec($bitplaneBinary);

        $bitplaneBinary = implode('', array_slice($bitplane, 8, 8));
        $planar_pixels[] = bindec($bitplaneBinary);
    }

    return $planar_pixels;
}

function convertPixelColoursToOutputBytes(array $pixelColours) {

    if ((count($pixelColours) & 15) != 0) {
        throw new \RuntimeException('Output byte array size is not a multiple of 16');
    }

    $outputBytes = [];

    $blocksOf16Pixels = array_chunk($pixelColours, 16); 
    foreach ($blocksOf16Pixels as $block) {
        $outputBytes = array_merge(
            $outputBytes,
            convertPixelColourArrayToPlanarArray($block)
        );
    }

    return $outputBytes;
}

$padding = 22;

$byteOffsets = [];
$outputBytes = [];

for ($type = 0; $type <2; $type++) {
    if ($type == 0) {
        $roadLinesColour = COLOUR_WHITE;
        $asphaltColour = COLOUR_ASPHALT;
        $grassColour = COLOUR_GRASS_1;
    } else {
        $roadLinesColour = COLOUR_ASPHALT;
        $asphaltColour = COLOUR_ASPHALT;
        $grassColour = COLOUR_GRASS_2;
    }

    // pixel width at bottom is 318
    // pixel width at top is 9

    $actualPixelWidthFloat = 318;
    for ($index = 0; $index < 99; $index++) {
        $actualPixelWidth = (int)$actualPixelWidthFloat;

        $roundedPixelWidth = (($actualPixelWidth - 1) & 0xffe0) + 32 + ($padding * 16);

        $textureStep = 1.0 / $actualPixelWidth;
        $texturePosition = 0;
        $midpointTexturePosition = $textureStep * ($roundedPixelWidth / 2);
        $pixelColours = [];

        $roadMultiplier = 1.25;

        $leftBrownBorderLeft = ($midpointTexturePosition - 0.50 * $roadMultiplier);
        $leftBrownBorderRight = ($midpointTexturePosition - 0.45 * $roadMultiplier);
        $rightBrownBorderLeft = ($midpointTexturePosition + 0.45 * $roadMultiplier);
        $rightBrownBorderRight = ($midpointTexturePosition + 0.50 * $roadMultiplier);

        $leftYellowLineLeft = ($midpointTexturePosition - 0.4075 * $roadMultiplier);
        $leftYellowLineRight = ($midpointTexturePosition - 0.395 * $roadMultiplier);
        $rightYellowLineLeft = ($midpointTexturePosition + 0.395 * $roadMultiplier);
        $rightYellowLineRight = ($midpointTexturePosition + 0.4075 * $roadMultiplier);

        //-0.395 + 0.263 = -0.132
        //0.395 - 0.263 = 0.132

        $whiteLine1Left = ($midpointTexturePosition + ((-0.132)-0.0125/2) * $roadMultiplier);
        $whiteLine1Right = ($midpointTexturePosition + ((-0.132)+0.0125/2) * $roadMultiplier);
        $whiteLine2Left = ($midpointTexturePosition + ((0.132)-0.0125/2) * $roadMultiplier);
        $whiteLine2Right = ($midpointTexturePosition + ((0.132)+0.0125/2) * $roadMultiplier);

        $asphaltLeft = ($midpointTexturePosition - 0.5 * $roadMultiplier);
        $asphaltRight = ($midpointTexturePosition + 0.5 * $roadMultiplier);

        for ($xpos = 0; $xpos < $roundedPixelWidth; $xpos++) {
            if (($texturePosition > $leftBrownBorderLeft) && ($texturePosition < $leftBrownBorderRight)) {
                $pixelColour = COLOUR_BROWN;
            } elseif (($texturePosition > $rightBrownBorderLeft) && ($texturePosition < $rightBrownBorderRight)) {
                $pixelColour = COLOUR_BROWN;
            } elseif (($texturePosition > $rightYellowLineLeft) && ($texturePosition < $rightYellowLineRight)) {
                $pixelColour = COLOUR_YELLOW;
            } elseif (($texturePosition > $leftYellowLineLeft) && ($texturePosition < $leftYellowLineRight)) {
               $pixelColour = COLOUR_YELLOW;
            } elseif (($texturePosition > $whiteLine1Left) && ($texturePosition < $whiteLine1Right)) {
                $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $whiteLine2Left) && ($texturePosition < $whiteLine2Right)) {
               $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $asphaltLeft) && ($texturePosition < $asphaltRight)) {
                $pixelColour = $asphaltColour;
            } else {
                $pixelColour = $grassColour;
            }

            $pixelColours[] = $pixelColour;
            $texturePosition += $textureStep;
        }

        $byteOffsets[] = (count($outputBytes) + ($roundedPixelWidth / 4)) - (160/2);

        $outputBytes = array_merge(
            $outputBytes,
            convertPixelColoursToOutputBytes($pixelColours)
        );

        $actualPixelWidthFloat-=3.13;
    }
}

$pixelColours = array_fill(0, 16, COLOUR_GRASS_2);
for ($index = 0; $index < 11; $index++) {
    $outputBytes = array_merge(
        $outputBytes,
        convertPixelColoursToOutputBytes($pixelColours)
    );
}

echo("byte_offsets:\n");
foreach ($byteOffsets as $byteOffset) {
    echo("    dc.l " . $byteOffset . "\n");
}

echo("\n");
echo("gfx_data:\n");
$outputBytesChunksOf8 = array_chunk($outputBytes, 8);
foreach ($outputBytesChunksOf8 as $chunkOf8) {
    $normalisedValues = [];
    foreach ($chunkOf8 as $byte) {
        $normalisedValues[] = '$' . dechex($byte>>4) . dechex($byte&15);
    }

    echo("    dc.b ". implode(",", $normalisedValues) ."\n");
}
