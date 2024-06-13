NASM = nasm

NASMFLAGS = -f elf64

SRC = input_test.asm

OUT = input_test.o

$(OUT): $(SRC)
	$(NASM) $(NASMFLAGS) -o $(OUT) $(SRC)

clean:
	rm -f $(OUT)