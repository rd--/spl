all:
	ghc -Wno-x-partial -Wno-incomplete-uni-patterns --make spl-indent
	mv spl-indent ~/opt/bin
	rm -f *.hi *.o

clean:
	rm -f *.hi *.o *~

indent:
	fourmolu -i *.hs

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns spl-indent.hs
