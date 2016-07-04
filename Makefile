_SUBPROG_FILTER = $(if $(SUBP_FILTER),--limit-subp $(SUBP_FILTER),)
_LEVEL = $(if $(LEVEL),--level=$(LEVEL),--level=0)
PROJECT = -Pspark_by_example.gpr

.PHONY: all pp clean distclean

all:
	gnatprove $(PROJECT) -j 2 $(_LEVEL) chap*.adb

pp:
	gnatpp $(PROJECT) -rnb

clean:
	gnatclean $(PROJECT)
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr

test_%: test_%.adb
	gnatmake -gnata -gnateE -f $^
	./$@

%:
	gnatprove $(PROJECT) -f -j 4 $(_SUBPROG_FILTER) $(_LEVEL) chap$@.adb
