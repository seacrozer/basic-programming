SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRC = $(wildcard $(SRC_DIR)/*.asm)
EXE = $(patsubst $(SRC_DIR)/%.asm, $(BIN_DIR)/%, $(SRC))
OBJ = $(patsubst $(SRC_DIR)/%.asm, $(OBJ_DIR)/%.o, $(SRC))

NASM = nasm
LD = ld

NASMFLAGS = -f elf32
LDFLAGS = -m elf_i386

all: $(EXE)

.SECONDARY: $(OBJ) 

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm | $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -g -o $@

$(BIN_DIR)/%: $(OBJ_DIR)/%.o | $(BIN_DIR)
	$(LD) $(LDFLAGS) $< -o $@

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)/* $(BIN_DIR)/*

