all:
	gnatprove -Pp.gpr -j 2 tests.adb

pp:
	gnatpp -Pp.gpr -rnb

clean:
	gnatclean -Pp.gpr
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr
