include ../base.mk

all:
	$(AS) -o ./target/$(ARCH)-unknown-none/debug/deps/boot.o ./src/$(ARCH)/boot.S $(ASFLAGS)
	xargo -v build $(CARGO_FLAGS) --features "$(ARCH)" --target $(ARCH)-unknown-none
	mv ./target/$(ARCH)-unknown-none/$(BUILD_MODE)/bsl4-boot ./target/$(ARCH)-unknown-none/$(BUILD_MODE)/bsl4-boot.bin

clean:
	cargo clean
	rm -rf ./target
	find . -name '*.o' -exec rm -r {} \;
	find . -name '*.a' -exec rm -r {} \;

