include ../base.mk

all: kernel boot.o
	$(LD) -o ./target/$(ARCH)-unknown-none/debug/bsl4.bin \
	-T ./src/arch/$(ARCH)/linker.ld \
	-Ltarget/$(ARCH)-unknown-none/debug -lbsl4 \
	./target/$(ARCH)-unknown-none/debug/deps/boot.o $(ASFLAGS)
	echo "Done!"

.PHONY: kernel
kernel:
	xargo -v build $(CARGO_FLAGS) --features "$(ARCH)" --target $(ARCH)-unknown-none


boot.o: ./src/arch/$(ARCH)/boot.S
	$(AS) -o ./target/$(ARCH)-unknown-none/debug/deps/boot.o ./src/arch/$(ARCH)/boot.S $(ASFLAGS)

clean:
	cargo clean
	rm -rf ./target
	find . -name '*.o' -exec rm -r {} \;
	find . -name '*.a' -exec rm -r {} \;

