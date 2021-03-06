VASM = vasmm68k_mot 
NM = m68k-ataribrownest-elf-nm
PHP = php

SOURCE_DIR = src/
GENERATED_SOURCE_DIR = $(SOURCE_DIR)generated/
BIN_DIR = bin/

BIN_FILES = $(PATCHES) $(BIN_DIR)0x80000.bin

PATCHES =\
	$(BIN_DIR)0x11b8c_store_background_shift.bin\
	$(BIN_DIR)0x11c70_jump_to_draw_background.bin\
	$(BIN_DIR)0x11cf8_draw_road.bin\
	$(BIN_DIR)0x70_vbl_vector.bin

0X80000_DEPENDENCIES =\
	$(GENERATED_SOURCE_DIR)road.s\
	$(SOURCE_DIR)draw_background.s\
	$(SOURCE_DIR)vbl.s

default: check_dependencies all

check_dependencies:
	command -v $(PHP) >/dev/null 2>&1 || { echo >&2 "I require $(PHP) but it's not installed.  Aborting."; exit 1; }
	command -v $(NM) >/dev/null 2>&1 || { echo >&2 "I require $(NM) but it's not installed.  Aborting."; exit 1; }
	command -v $(VASM) >/dev/null 2>&1 || { echo >&2 "I require $(VASM) but it's not installed.  Aborting."; exit 1; }

.PHONY: clean $(GAMEFILES_DESTINATION_DIR) $(GENERATED_SOURCE_DIR)

clean:
	rm $(GENERATED_SOURCE_DIR)* || true
	rmdir $(GENERATED_SOURCE_DIR) || true
	rm $(BIN_DIR)*.bin || true
	rm $(BIN_DIR)*.o || true

all: $(GENERATED_SOURCE_DIR) $(BIN_FILES)

$(PATCHES): $(BIN_DIR)%.bin: $(SOURCE_DIR)%.s $(GENERATED_SOURCE_DIR)symbols_0x80000.inc
	$(VASM) $< -Fbin -o $@

$(BIN_DIR)0x80000.bin: $(SOURCE_DIR)0x80000.s $(0X80000_DEPENDENCIES) $(SOURCE_DIR)post_process_0x80000.php $(GENERATED_SOURCE_DIR)symbols_0x80000.php
	$(VASM) $< -Fbin -o $@
	$(PHP) $(SOURCE_DIR)post_process_0x80000.php $(GENERATED_SOURCE_DIR)symbols_0x80000.php $(BIN_DIR)0x80000.bin

$(BIN_DIR)0x80000.o: $(SOURCE_DIR)0x80000.s $(0X80000_DEPENDENCIES) 
	$(VASM) $< -Felf -o $@

$(GENERATED_SOURCE_DIR)symbols_0x80000.php: $(BIN_DIR)0x80000.o $(SOURCE_DIR)generate_symbols.php
	@echo "Generate symbols..."
	$(NM) $< > $(GENERATED_SOURCE_DIR)symbols_0x80000.txt
	$(PHP) $(SOURCE_DIR)generate_symbols.php $(GENERATED_SOURCE_DIR)symbols_0x80000.txt > $@

$(GENERATED_SOURCE_DIR)symbols_0x80000.inc: $(GENERATED_SOURCE_DIR)symbols_0x80000.php $(SOURCE_DIR)process_symbols.php
	@echo "Process symbols..."
	$(PHP) $(SOURCE_DIR)process_symbols.php $(GENERATED_SOURCE_DIR)symbols_0x80000.php > $(GENERATED_SOURCE_DIR)symbols_0x80000.inc

$(GENERATED_SOURCE_DIR)road.s: $(SOURCE_DIR)generate_road.php $(GENERATED_SOURCE_DIR)
	$(PHP) $< > $@

$(GENERATED_SOURCE_DIR):
	mkdir -p $@
