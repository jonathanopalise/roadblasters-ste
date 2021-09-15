<?php

const COLOUR_RED = 2;             // 0010 -> 0010
const COLOUR_WHITE = 15;           // 0110 -> 0110
const COLOUR_GREY = 5;            // 0101 -> 0101
const COLOUR_BROWN = 8;

const COLOUR_ASPHALT = 0;

const COLOUR_GRASS_1 = 11;        // 1100 -> 1000
const COLOUR_GRASS_2 = 12;        // 1110 -> 1100
const COLOUR_YELLOW = 6;

// bitplane 0: hardcode to 1
// bitplane 1: hardcode to 1
// bitplane 2: hardcode to 0
// bitplane 3: copy

// bitplane 0: hardcode to 1
// bitplane 1: hardcode to 1
// bitplane 2: hardcode to 1
// bitplane 3: copy


// leave grass_2 and red alone, transform dark asphalt to white
//
// red (unchanged)                = 0010 -> 0010
// grass_2 (unchanged)            = 1110 -> 1110
// dark_asphalt (change to white) = 1111 -> 0110
//
// could we use a "not source" (12) copy to copy bitplane 1 to bitplane 3?
// - bitplane 0 - solid 0
// - bitplane 1 - direct copy of source bitplane 1
// - bitplane 2 - direct copy of source bitplane 2
// - bitplane 3 - inverse copy of source bitplane 3
//
// white         = 0110 -> 0110
// light asphalt = 1101 -> 0110
// grass_1       = 1000 -> 1000
//
// method HERE:
// - bitplane 0 - solid 0
// - bitplane 1 - copy from source bitplane 2
// - bitplane 2 - copy from source bitplane 2
// - bitplane 3 - inverst copy of source bitplane 2

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

/*function transformPixelColour($colour) {
    $transformations = [
        COLOUR_WHITE => COLOUR_WHITE,
        COLOUR_GREY => COLOUR_GREY,
        COLOUR_LIGHT_ASPHALT => COLOUR_LIGHT_ASPHALT,
        COLOUR_GRASS_1 => (COLOUR_GRASS_1 & 11),
        COLOUR_RED => COLOUR_RED,
        COLOUR_DARK_ASPHALT => COLOUR_DARK_ASPHALT,
        COLOUR_GRASS_2 => (COLOUR_GRASS_2 & 13),
    ];

    if (!isset($transformations[$colour])) {
        throw new \Exception('Transformation not defined for colour '.$colour);
    }

    return $transformations[$colour];
}*/

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
        $rumbleStripColour = COLOUR_BROWN;
        $roadLinesColour = COLOUR_WHITE;
        $asphaltColour = COLOUR_ASPHALT;
        $grassColour = COLOUR_GRASS_1;
    } else {
        $rumbleStripColour = COLOUR_BROWN;
        $roadLinesColour = COLOUR_ASPHALT;
        $asphaltColour = COLOUR_ASPHALT;
        $grassColour = COLOUR_GRASS_2;
    }

    // pixel width at bottom is 318
    // pixel width at top is 9

    $actualPixelWidthFloat = 318;
    for ($index = 0; $index < 99; $index++) {
        $actualPixelWidth = (int)$actualPixelWidthFloat;

        /*$computedRoadLinesColour = COLOUR_LIGHT_ASPHALT;
        if ($roadLinesColour == COLOUR_WHITE) {
            $computedRoadLinesColour = COLOUR_WHITE;

            if ($actualPixelWidth < 30) {
                $computedRoadLinesColour = COLOUR_LIGHT_ASPHALT;
            } elseif ($actualPixelWidth < 60) {
                $computedRoadLinesColour = COLOUR_GREY;
            }
        }*/

        $roundedPixelWidth = (($actualPixelWidth - 1) & 0xffe0) + 32 + ($padding * 16);
        //echo("rounded pixel width: ".$roundedPixelWidth."\n");

        $textureStep = 1.0 / $actualPixelWidth;
        $texturePosition = 0;
        $midpointTexturePosition = $textureStep * ($roundedPixelWidth / 2);
        $pixelColours = [];

        $roadMultiplier = 1.15;

        $leftRumbleStripLeft = ($midpointTexturePosition + 0.46 * $roadMultiplier);
        $leftRumbleStripRight = ($midpointTexturePosition + 0.54 * $roadMultiplier);
        $rightRumbleStripLeft = ($midpointTexturePosition - 0.54 * $roadMultiplier);
        $rightRumbleStripRight = ($midpointTexturePosition - 0.46 * $roadMultiplier);

        $whiteLine1Left = ($midpointTexturePosition + 0.42 * $roadMultiplier);
        $whiteLine1Right = ($midpointTexturePosition + 0.44 * $roadMultiplier);
        $whiteLine2Left = ($midpointTexturePosition + 0.46 * $roadMultiplier);
        $whiteLine2Right = ($midpointTexturePosition + 0.48 * $roadMultiplier);
        $whiteLine3Left = ($midpointTexturePosition - 0.44 * $roadMultiplier);
        $whiteLine3Right = ($midpointTexturePosition - 0.42 * $roadMultiplier);
        $whiteLine4Left = ($midpointTexturePosition - 0.24 * $roadMultiplier);
        $whiteLine4Right = ($midpointTexturePosition - 0.22 * $roadMultiplier);
        $whiteLine5Left = ($midpointTexturePosition + 0.22 * $roadMultiplier);
        $whiteLine5Right = ($midpointTexturePosition + 0.24 * $roadMultiplier);
        $whiteLine6Left = ($midpointTexturePosition - 0.01 * $roadMultiplier);
        $whiteLine6Right = ($midpointTexturePosition + 0.01 * $roadMultiplier);

        $asphaltLeft = ($midpointTexturePosition - 0.5 * $roadMultiplier);
        $asphaltRight = ($midpointTexturePosition + 0.5 * $roadMultiplier);

        for ($xpos = 0; $xpos < $roundedPixelWidth; $xpos++) {
            if (($texturePosition > $leftRumbleStripLeft) && ($texturePosition < $leftRumbleStripRight)) {
                $pixelColour = $rumbleStripColour; // left rumble strip
            } elseif (($texturePosition > $rightRumbleStripLeft) && ($texturePosition < $rightRumbleStripRight)) {
                $pixelColour = $rumbleStripColour; // right rumble strip
            } elseif (($texturePosition > $whiteLine1Left) && ($texturePosition < $whiteLine1Right)) {
                $pixelColour = COLOUR_YELLOW;
            } elseif (($texturePosition > $whiteLine2Left) && ($texturePosition < $whiteLine2Right)) {
                $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $whiteLine3Left) && ($texturePosition < $whiteLine3Right)) {
               $pixelColour = COLOUR_YELLOW;
            } elseif (($texturePosition > $whiteLine4Left) && ($texturePosition < $whiteLine4Right)) {
               $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $whiteLine5Left) && ($texturePosition < $whiteLine5Right)) {
               $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $whiteLine6Left) && ($texturePosition < $whiteLine6Right)) {
                $pixelColour = $roadLinesColour;
            } elseif (($texturePosition > $asphaltLeft) && ($texturePosition < $asphaltRight)) {
                $pixelColour = $asphaltColour;
            } else {
                $pixelColour = $grassColour;
            }

            $pixelColours[] = $pixelColour;
            $texturePosition += $textureStep;
        }

        // rounded pixel width: 160
        // bytes width: 80 (2 pixels per byte)
        // does count($outputBytes) need to be multiplied by 4? (long words)
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
