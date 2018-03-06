_SUBPROG_FILTER = $(if $(SUBP_FILTER),--limit-subp=$(SUBP_FILTER),)
_LINE_FILTER = $(if $(LINE_FILTER),--limit-line=$(LINE_FILTER),)
_LEVEL = $(if $(LEVEL),--level=$(LEVEL),--level=0)
_TIMEOUT = $(if $(TIMEOUT),--timeout=$(TIMEOUT),--timeout=0)
_PARALLEL = $(if $(PARALLEL),-j $(PARALLEL),-j 0)
_PROJECT = $(if $(PROJECT),-P $(PROJECT),-P spark_by_example.gpr)
_WHYCONF = $(if $(WHYCONF),--why3-conf=$(WHYCONF),)

.PHONY: all pp clean distclean

all:
	gnatprove $(_PROJECT) -j 4 $(_WHYCONF) $(_LEVEL) $(_TIMEOUT) chap*.adb

pp:
	gnatpp $(_PROJECT) -rnb

clean:
	gnatclean $(_PROJECT)
	- rm -rf *~

distclean: clean
	- rm -rf gnatprove auto.cgpr

test_%: test_%.adb
	gnatmake -gnata -gnateE -f $^
	./$@

%:
	gnatprove $(_PROJECT) -f $(_PARALLEL) $(_LINE_FILTER) $(_SUBPROG_FILTER) $(_WHYCONF) $(_LEVEL) $(_TIMEOUT) chap$@.adb

prove:
	gnatprove $(_PROJECT) -f $(_PARALLEL) $(_LINE_FILTER) $(_SUBPROG_FILTER) $(_WHYCONF) $(_LEVEL) $(_TIMEOUT) $(FILE)

prove-coq:
	gnatprove --prover=coq $(_PROJECT) -f $(_PARALLEL) $(_LINE_FILTER) $(_SUBPROG_FILTER) $(_WHYCONF) $(FILE)
