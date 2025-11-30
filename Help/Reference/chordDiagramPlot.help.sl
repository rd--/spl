# chordDiagramPlot

- _chordDiagramPlot(c)_

Plot the chord diagram _c_.

Plot a chord diagram specified as a length vector:

~~~spl svg=A
[3 6 10 13 11 4 7 10 3 12 4 13 6 9 12 5]
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/chordDiagramPlot-A.svg)

Plot a chord diagram specified as an edge list:

~~~spl svg=B
[1 2; 3 5; 4 9; 6 7; 8 10]
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/chordDiagramPlot-B.svg)

Plot a chord diagram specified as a `ChordDiagram` value:

~~~spl svg=C
ChordDiagram(
	[
		1  6; 2 12; 3 11;
		4  9; 5 10; 7 13;
		8 14
	]
).chordDiagramPlot
~~~

![](sw/spl/Help/Image/chordDiagramPlot-C.svg)

* * *

See also: ChordDiagram, chordDiagramCount, chordDiagrams

Guides: Combinatorial Functions, Plotting Functions
