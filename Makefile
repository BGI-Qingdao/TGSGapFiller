.PHONY: all

PREFIX ?='/usr/local/TGS-GapCloser'

all: minimap2 minimap2/libminimap2.a minimap2/minimap2
	cd main_src_ont && make
	mkdir -p tgsgapcloserbin
	cp minimap2/minimap2 tgsgapcloserbin/
	mkdir -p lib
	cp minimap2/libminimap2.a lib/

minimap2:
	echo "error: please download/link minimap2 into this folder "
	exit 1

minimap2/minimap2:
	cd minimap2 && make

minimap2/libminimap2.a:
	cd minimap2 && make

condainstall: all
	echo  "Installed into ${PREFIX}"
	mkdir -p  ${PREFIX}
	mkdir -p  ${PREFIX}/bin
	mkdir -p  ${PREFIX}/lib
	cp tgsgapcloser ${PREFIX}/bin
	chmod a+x ${PREFIX}/bin/tgsgapcloser
	cp -r tgsgapcloserbin ${PREFIX}/bin
	chmod a+x ${PREFIX}/bin/tgsgapcloserbin/*
	cp -r lib/* ${PREFIX}/lib

clean:
	cd main_src_ont && make clean
	rm -rf tgsgapcloserbin
