include base.mk

# TODO: Generalize platform once available.

all:
	$(MAKE) -C bsl4 all
	$(PROGRESS) "All" "Done!"

clean:
	$(MAKE) -C bsl4 clean

