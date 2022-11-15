GFLAGS=--32
LDFLAGS=--oformat binary -nostdlib -ffreestanding -shared -melf_i386

ENTRY=bootloader
SRC_DIR=src
SRCS=$(wildcard ./$(SRC_DIR)/*.s)
OBJS=$(SRCS:.s=.o)

OUTPUT_PATH=bin


ASM=as

dirs:
	mkdir -p ./$(OUTPUT_PATH)/ 

clean:
	- rm ./$(SRC_DIR)/*.o ; \
	rm ./$(OUTPUT_PATH)/* ; \
	clear

# This will assemble all .s (assembly) files to .o (object) files
# ASM is a Makefile variable for the assembler
%.o: %.s
	$(ASM) -o $@ -c $< $(GFLAGS)

# This will link the object files into a binary
# LD is a Makefile variable for the linker 
# -Ttext sets the address of the .text section
binary: $(OBJS)
	$(LD) -o ./$(OUTPUT_PATH)/$(ENTRY) $^ $(LDFLAGS) -Ttext 0x0

iso:
	dd if=/dev/zero of=./$(OUTPUT_PATH)/$(ENTRY).iso bs=1 count=512 && \
	dd if=./$(OUTPUT_PATH)/$(ENTRY) of=./$(OUTPUT_PATH)/$(ENTRY).iso conv=notrunc bs=512 count=1