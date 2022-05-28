include base.mk

BASE="$(shell pwd)"

all:
	@mkdir -p "$(BASE)/target"
	@mkdir -p "$(BASE)/target/obj"
	@mkdir -p "$(BASE)/target/out"
	@mkdir -p "$(BASE)/target/intermediate"
	@$(MAKE) -C bsl4 BASE="$(BASE)" all
	$(PROGRESS) "Status" "Done!"

clean:
	@rm -rf target
	$(PROGRESS) "Status" "Cleaned!"

