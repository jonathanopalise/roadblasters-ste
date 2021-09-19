# RoadBlasters STE

_Enhancements to the Atari ST version of RoadBlasters to support STE hardware features_

![Screenshot of current progress](https://github.com/jonathanopalise/roadblasters-ste/blob/master/screenshot.png)

## What's this all about?

This is intended to be a series of modifications to the Atari ST game RoadBlasters to take advantage of the enhanced
hardware in the STE. This project is at a very early stage and unlikely to be of interest to end users.

The modified version of the code doesn't exist as a runnable disk image as yet. You need to run the standard
unmodified game in the Hatari emulator, and load in the patches using the integrated debugger. Further instructions
are below. 

## How to build and run

Before attempting to build, you'll need the following executable dependencies to be available in your path:

- `vasm` (http://sun.hasenbraten.de/vasm/)
- `m68k-ataribrownest-elf-nm` (https://bitbucket.org/ggnkua/bigbrownbuild-git/src/master/)
- `php` (https://www.php.net/)

The build process is controlled by a `Makefile`. The `Makefile` is confirmed to work with Linux. It could possibly be
repurposed for Windows with some changes - please get in touch if you can help.

Once you have all of the above executables in your path, run `make` to start the build process. Should the build process
succeed, there will be a series of files present in the `bin` directory - these contain binary code to be overlaid on
top of the existing RoadBlasters game code. In the event that the build process fails, please raise an issue against the
project and I'll help in any way I can.

In order to apply these patches, you'll need to start the Hatari emulator, configure the machine as an STE with 1 Meg or
more of memory, then load and run RoadBlasters from the Automation #84 disk image
(https://www.exxoshost.co.uk/atari/games/automation/AUTOMATION2015A.htm). Start the debugger (`AltGr + Pause`), then
enter the following lines, replacing `<path-to-cloned-repository>` with the directory to which you've cloned the repo:

- `loadbin <path-to-cloned-repository>/bin/0x70_vbl_vector.bin 0x70`
- `loadbin <path-to-cloned-repository>/bin/0x11c70_jump_to_draw_background.bin 0x11c70`
- `loadbin <path-to-cloned-repository>/bin/0x11cf8_draw_road.bin 0x11cf8`
- `loadbin <path-to-cloned-repository>/bin/0x80000.bin 0x80000`

Finally, enter `c` (for "continue") at the debugger prompt, and press the Enter key. The game should continue running,
but with the updated code in place of the new code. Note that it's preferable to do the above while the game is on
the title screen rather than in-game - this is because the patches overwrite game code that may be in the process of
running, and this may cause the game to crash.

If you continue to see bombs or screen corruption despite repeated efforts, it's possible that something has gone
wrong - raise an issue against the project and I'll help in any way I can.
