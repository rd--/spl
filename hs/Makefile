all:
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make indent
	mv indent ~/opt/bin/spl-indent
	rm -f *.hi *.o

fixCategory : fixCategory.hs
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make fixCategory

toDoctest : toDoctest.hs
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make toDoctest

toFenced : toFenced.hs
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make toFenced

clean:
	rm -f fixCategory toDoctest toFenced *.hi *.o *~

indent:
	fourmolu -i *.hs

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns indent.hs
