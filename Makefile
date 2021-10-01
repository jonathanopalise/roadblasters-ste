VASM = vasmm68k_mot
VLINK = vlink
UPX = upx
PHP = php

SOURCE_DIR = src/
GENERATED_SOURCE_DIR = $(SOURCE_DIR)generated/
BIN_DIR = bin/

default: check_dependencies all

check_dependencies:
	command -v $(VASM) >/dev/null 2>&1 || { echo >&2 "I require $(VASM) but it's not installed.  Aborting."; exit 1; }
	command -v $(VLINK) >/dev/null 2>&1 || { echo >&2 "I require $(VLINK) but it's not installed.  Aborting."; exit 1; }
	command -v $(UPX) >/dev/null 2>&1 || { echo >&2 "I require $(UPX) but it's not installed.  Aborting."; exit 1; }
	command -v $(PHP) >/dev/null 2>&1 || { echo >&2 "I require $(PHP) but it's not installed.  Aborting."; exit 1; }

clean:
	rm $(BIN_DIR)*.bin || true
	rm $(BIN_DIR)*.o || true

all: $(BIN_DIR)road.prg

$(GENERATED_SOURCE_DIR)blitter_road.s: $(SOURCE_DIR)generate_blitter_road.php
	$(PHP) $< > $@

$(BIN_DIR)road.prg: $(SOURCE_DIR)road.s $(SOURCE_DIR)draw_road.s $(GENERATED_SOURCE_DIR)blitter_road.s
	$(VASM) -devpac $(SOURCE_DIR)road.s -Felf -o $(BIN_DIR)road.o
	$(VLINK) -s -S -x -b ataritos $(BIN_DIR)road.o -o $@
	rm $(BIN_DIR)road.o


