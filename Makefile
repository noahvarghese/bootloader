GFLAGS=-m32
LDFLAGS=-nostdlib -ffreestanding

BOOTLOADER=hello_world
BOOTLOADER_SRC=src/hellow_world.s
BOOTLOADER_OBJS=$(BOOTLOADER_SRC:.s=.o)

dirs:
	mkdir -p bin

clean:
	rm ./**/*.o

# This will assemble all .s (assembly) files to .o (object) files
# ASM is a Makefile variable for the assembler
%.o: %.s
	$(ASM) -o $@ -c $< $(GFLAGS)

# This will link the object files into a binary
# LD is a Makefile variable for the linker 
# -Ttext sets the address of the .text section
binary: $(BOOTLOADER_OBJS)
	$(LD) -o ./bin/$(BOOTSECT) $^ $(LDFLAGS) -Ttext 0x0

# TODO: start implementing bootloader to run this
#
# iso:
# 	dd if=/dev/zero of=boot.iso bs=512 count=2880
# 	dd if=./bin/$(BOOTSECT) of=boot.iso conv=notrunc bs=512 count=1