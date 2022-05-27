include ../base.mk

all: kernel
	echo "Done!"

.PHONY: kernel
kernel:
	xargo -v build $(CARGO_FLAGS) --features "$(ARCH)" --target $(ARCH)-unknown-none

clean:
	cargo clean
	rm -rf ./target
	find . -name '*.o' -exec rm -r {} \;
	find . -name '*.a' -exec rm -r {} \;

