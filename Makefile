all:
	gnatprove -Pp.prj -j 2 tests.adb

pp:
	gnatpp -Pp.prj -rnb

clean:
	gnatclean -Pp.prj
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr
