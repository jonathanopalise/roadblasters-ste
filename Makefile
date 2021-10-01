VASM = vasmm68k_mot
VLINK = vlink
UPX = upx

SOURCE_DIR = src/
BIN_DIR = bin/

default: check_dependencies all

check_dependencies:
	command -v $(VASM) >/dev/null 2>&1 || { echo >&2 "I require $(VASM) but it's not installed.  Aborting."; exit 1; }
	command -v $(VLINK) >/dev/null 2>&1 || { echo >&2 "I require $(VLINK) but it's not installed.  Aborting."; exit 1; }
	command -v $(UPX) >/dev/null 2>&1 || { echo >&2 "I require $(UPX) but it's not installed.  Aborting."; exit 1; }

clean:
	rm $(BIN_DIR)*.bin || true
	rm $(BIN_DIR)*.o || true

all: $(BIN_DIR)road.prg

$(BIN_DIR)road.prg: $(SOURCE_DIR)road.s
	$(VASM) -devpac $(SOURCE_DIR)road.s -Felf -o $(BIN_DIR)road.o
	$(VLINK) -s -S -x -b ataritos $(BIN_DIR)road.o -o $@
	rm $(BIN_DIR)road.o
