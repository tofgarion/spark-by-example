all:
	gnatprove -Pp.gpr -j 2 chap*.adb

pp:
	gnatpp -Pp.gpr -rnb

clean:
	gnatclean -Pp.gpr
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr
