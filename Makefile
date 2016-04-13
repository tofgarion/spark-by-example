.PHONY: all pp clean distclean

all:
	gnatprove -Pspark.gpr -j 2 --proof=progressive --timeout=120 chap*.adb

pp:
	gnatpp -Pspark.gpr -rnb

clean:
	gnatclean -Pspark.gpr
	-rm -rf *~

distclean: clean
	-rm -rf gnatprove auto.cgpr

%:
	gnatprove -Pspark.gpr -j 2 --proof=progressive --timeout=120 chap$@.adb
