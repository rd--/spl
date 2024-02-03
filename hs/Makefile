all:
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make indent
	mv indent ~/opt/bin/spl-indent
	rm -f *.hi *.o

fixCategory : fixCategory.hs
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make fixCategory

toFenced : toFenced.hs
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make toFenced

clean:
	rm -f fixCategory toFenced *.hi *.o *~
