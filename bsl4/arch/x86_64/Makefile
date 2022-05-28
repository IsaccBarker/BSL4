include ../../../base.mk

DEPS = include/vga.h
OBJ = boot.o bsl.o vga.o

all: $(OBJ)
	$(PROGRESS) "LD" "bsl4.bin"
	@$(CC) -T linker.ld -o "$(BASE)/target/out/bsl4.bin" -ffreestanding -O2 -nostdlib "$(BASE)"/target/obj/*.o -lgcc

%.o: %.S $(DEPS)
	$(PROGRESS) "AS" "$<"
	@$(AS) -o "$(BASE)/target/obj/$@" $< $(ASFLAGS)

%.o: %.c $(DEPS)
	$(PROGRESS) "CC" "$<"
	@$(CC) -S -o "$(BASE)/target/intermediate/$<.s" $< -std=gnu99 -ffreestanding -O2 -Wall -Wextra $(CFLAGS)
	@$(AS) -o "$(BASE)/target/obj/$@" "$(BASE)/target/intermediate/$<.s" $(ASFLAGS)

