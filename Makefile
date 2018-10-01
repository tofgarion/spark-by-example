include Makefile-common

.PHONY: all-chapters clean-stats

CHAPTERS = non-mutating maxmin binary-search mutating numeric heap \
	sorting classic-sorting

all-chapters: $(CHAPTERS)
	for chapter in $(CHAPTERS); do \
	make -C $$chapter all;         \
	done
	$(if $(STATS),make -C stats recap,)

clean-stats:
	make -C ./stats clean
