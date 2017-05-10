_SUBPROG_FILTER = $(if $(SUBP_FILTER),--limit-subp $(SUBP_FILTER),)
_LEVEL = $(if $(LEVEL),--level=$(LEVEL),--level=0)
_TIMEOUT = $(if $(TIMEOUT),--timeout=$(TIMEOUT),--timeout=0)
_PARALLEL = $(if $(PARALLEL),-j $(PARALLEL),-j 0)
_PROJECT = $(if $(PROJECT),-P $(PROJECT),-P spark_by_example.gpr)

.PHONY: all pp clean distclean

all:
	gnatprove $(_PROJECT) -j 4 $(_TIMEOUT) $(_LEVEL) chap*.adb

pp:
	gnatpp $(_PROJECT) -rnb

clean:
	gnatclean $(_PROJECT)
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr

test_%: test_%.adb
	gnatmake -gnata -gnateE -f $^
	./$@

%:
	gnatprove $(_PROJECT) -f $(_PARALLEL) $(_SUBPROG_FILTER) $(_LEVEL) $(_TIMEOUT) chap$@.adb

prove:
	gnatprove $(_PROJECT) -f $(_PARALLEL) $(_SUBPROG_FILTER) $(_LEVEL) $(_TIMEOUT) $(FILE)
