ENTRY=hello_world
S_SRCS=$(wildcard *.s)
S_OBJS=$(S_SRCS:.s=.o)
ASM=as

dirs:
	mkdir -p bin

clean:
	rm ./*.o

# This will assemble all .s (assembly) files to .o (object) files
# ASM is a Makefile variable for the assembler
%.o: %.s
	$(ASM) -o $@ -c $< $(GFLAGS)

# This will link the object files into a binary
# LD is a Makefile variable for the linker 
binary: $(S_OBJS)
	$(LD) -o ./bin/$(ENTRY) $^