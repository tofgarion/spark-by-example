_SUBPROG_FILTER = $(if $(SUBP_FILTER),--limit-subp $(SUBP_FILTER),)
_LEVEL = $(if $(LEVEL),--level=$(LEVEL),--level=0)
.PHONY: all pp clean distclean

all:
	gnatprove -Pspark.gpr -j 2 $(_LEVEL) chap*.adb

pp:
	gnatpp -Pspark.gpr -rnb

clean:
	gnatclean -Pspark.gpr
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr

%:
	gnatprove -Pspark.gpr -f -j 4 $(_SUBPROG_FILTER) $(_LEVEL) chap$@.adb
