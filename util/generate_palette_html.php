<?php

if ($argc != 2) {
    echo("Usage: php generate_palette_html.php [binaryFile]\n\n");
    exit(1);
}

$filename = $argv[1];
$inputPalette = file_get_contents($filename);

if (strlen($inputPalette) != 32) {
    fwrite(STDERR, "Palette binary data file must be exactly 32 bytes length.\n\n");
    exit(1);
}

echo("<table border=\"1\">\n");

$offset = 0;
for ($index = 0; $index < 16; $index++) {
    $red = ord($inputPalette[$offset])<<5;
    $greenAndBlue = ord($inputPalette[$offset+1]);
    $green = ($greenAndBlue >> 4) << 5;
    $blue = ($greenAndBlue & 15) << 5;

    $row = sprintf(
        "<tr><td>Index %s</td><td style=\"width: 50; height: 50; background-color: rgb(%s,%s,%s)\"></td></tr>\n",
        $index,
        $red,
        $green,
        $blue
    );

    echo($row);
    $offset += 2;
}

echo("</table>\n");
