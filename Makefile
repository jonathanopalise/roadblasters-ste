VASM = vasmm68k_mot
VLINK = vlink
PHP = php

SOURCE_DIR = src/
GENERATED_SOURCE_DIR = $(SOURCE_DIR)generated/
BIN_DIR = bin/

ROAD_PRG_DEPS =\
	$(GENERATED_SOURCE_DIR)blitter_road.s\
	$(SOURCE_DIR)draw_blitter_background.s\
	$(SOURCE_DIR)draw_blitter_road.s\
	$(SOURCE_DIR)store_background_shift.s\
	$(SOURCE_DIR)l03da\
	$(SOURCE_DIR)l03db\
	$(SOURCE_DIR)l03dc\
	$(SOURCE_DIR)l03dd\
	$(SOURCE_DIR)l03de\
	$(SOURCE_DIR)l03df\
	$(SOURCE_DIR)l03e0\
	$(SOURCE_DIR)l03e1\
	$(SOURCE_DIR)l03e2\
	$(SOURCE_DIR)l03e3\
	$(SOURCE_DIR)l03e4\
	$(SOURCE_DIR)l03e5\
	$(SOURCE_DIR)l03e6\
	$(SOURCE_DIR)l03e7\
	$(SOURCE_DIR)l03e8\
	$(SOURCE_DIR)l03e9\
	$(SOURCE_DIR)l03ea\
	$(SOURCE_DIR)l03eb\
	$(SOURCE_DIR)l03ec\
	$(SOURCE_DIR)l03ed\
	$(SOURCE_DIR)l03ee\
	$(SOURCE_DIR)l03ef\
	$(SOURCE_DIR)l03f0\
	$(SOURCE_DIR)l03f1\
	$(SOURCE_DIR)l03f2\
	$(SOURCE_DIR)l03f3\
	$(SOURCE_DIR)l03f4\
	$(SOURCE_DIR)l03f5\
	$(SOURCE_DIR)l03f6\
	$(SOURCE_DIR)l03f7\
	$(SOURCE_DIR)l03f8\
	$(SOURCE_DIR)l03f9\
	$(SOURCE_DIR)l03fa\
	$(SOURCE_DIR)l03fb\
	$(SOURCE_DIR)l03fc\
	$(SOURCE_DIR)l03fd\
	$(SOURCE_DIR)l03fe\
	$(SOURCE_DIR)l03ff\
	$(SOURCE_DIR)l0400\
	$(SOURCE_DIR)l0401\
	$(SOURCE_DIR)l0402\
	$(SOURCE_DIR)l0403\
	$(SOURCE_DIR)l0404\
	$(SOURCE_DIR)l0405\
	$(SOURCE_DIR)l0406\
	$(SOURCE_DIR)l0407\
	$(SOURCE_DIR)l0408\
	$(SOURCE_DIR)l0409\
	$(SOURCE_DIR)l040a\
	$(SOURCE_DIR)l040b\
	$(SOURCE_DIR)l040c\
	$(SOURCE_DIR)l040d\
	$(SOURCE_DIR)l040e\
	$(SOURCE_DIR)l040f\
	$(SOURCE_DIR)l0410\
	$(SOURCE_DIR)l0411\
	$(SOURCE_DIR)l0412\
	$(SOURCE_DIR)l0413\
	$(SOURCE_DIR)l0414\
	$(SOURCE_DIR)music.s

default: check_dependencies all

check_dependencies:
	command -v $(VASM) >/dev/null 2>&1 || { echo >&2 "I require $(VASM) but it's not installed.  Aborting."; exit 1; }
	command -v $(VLINK) >/dev/null 2>&1 || { echo >&2 "I require $(VLINK) but it's not installed.  Aborting."; exit 1; }
	command -v $(PHP) >/dev/null 2>&1 || { echo >&2 "I require $(PHP) but it's not installed.  Aborting."; exit 1; }

clean:
	rm $(BIN_DIR)*.bin || true
	rm $(BIN_DIR)*.o || true

all: $(BIN_DIR)road.prg

$(GENERATED_SOURCE_DIR)blitter_road.s: $(SOURCE_DIR)generate_blitter_road.php
	$(PHP) $< > $@

$(BIN_DIR)road.prg: $(ROAD_PRG_DEPS)
	$(VASM) -devpac $(SOURCE_DIR)road.s -Felf -o $(BIN_DIR)road.o
	$(VLINK) -s -S -x -b ataritos $(BIN_DIR)road.o -o $@
	rm $(BIN_DIR)road.o

