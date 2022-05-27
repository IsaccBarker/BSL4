include base.mk

# TODO: Generalize platform once available.

all: check_cargo check_xargo getenv
	$(MAKE) -C bsl4 all
	echo "Done!"

check_cargo:
ifeq (, $(shell which cargo))
ifeq ($(OS),Windows_NT)
echo "Automatic Rust installation is not supported on windows. Please install via Rustup."
endif
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
endif

check_xargo:
ifeq (, $(shell which xargo))
cargo install xargo
endif

getenv:
ifeq ($(BUILD_MODE), "release")
CARGO_FLAGS := --release $(CARGO_FLAGS)
endif

clean:
	$(MAKE) -C bsl4 clean

