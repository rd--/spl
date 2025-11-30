+DyckWord{
	chordDiagram { :self |
		ChordDiagram(self.edgeList)
	}
	chordDiagramPlot { :self |
		self.edgeList.chordDiagramPlot
	}
	edgeList { :self |
		let [a, b] = self.tokens;
		let w = self.word;
		let n = w.size;
		let e = [];
		let h = self.heights;
		1.toDo(n) { :i |
			(w[i] = a).ifTrue {
				let j = h.indexOfStartingAtBy(h[i], i + 1, =) - 1;
				e.add([i, j])
			}
		};
		e
	}
	graph { :self |
		Graph(self.vertexList, self.edgeList)
	}
	graphPlot { :self |
		self.graph.graphPlot
	}
	linearGraphPlot { :self |
		self.graph.linearGraphPlot
	}
	vertexList { :self |
		[1 .. self.word.size]
	}
}
+List{
	DyckWord { :self |
		let [b, a] = self.minMax;
		DyckWord(self, [a, b])
	}
}

# DyckWord

- _DyckWord([x₁ x₂ …], [a b]=[1 0])_

A `Type` representing a Dyck word.

On the letters _1,-1_, _n=4_:

```
>>> let w = DyckWord(
>>> 	[1 1 -1 1 -1 -1 1 -1],
>>> 	[1 -1]
>>> );
>>> (
>>> 	w.heights,
>>> 	w.parenthesization,
>>> 	w.binaryExpansion,
>>> 	w.integer, w.edgeList
>>> )
(
	[0 1 2 1 2 1 0 1 0],
	'(()())()',
	[1 1 0 1 0 0 1 0],
	210,
	[1 6; 2 3; 4 5; 7 8]
)
```

Corresponding Lukasiewicz-word:

```
>>> let w = DyckWord(
>>> 	[1 1 0 0 1 0],
>>> 	[1 0]
>>> );
>>> (w.integer, w.lukasiewiczWord)
(50, [2 1 0 0])

>>> let w = DyckWord(
>>> 	[1 1 1 1 0 0 1 0 0 1 1 0 0 0],
>>> 	[1 0]
>>> );
>>> (w.integer, w.lukasiewiczWord)
(15512, [1 2 2 1 0 0 1 0])
```

Plot heights, _n=12_:

~~~spl svg=A
DyckWord(
	[
		1 0 1 1 1 1 0 1 0 0
		1 0 1 1 0 1 0 1 1 0
		0 0 0 0
	],
	[1 0]
).heights.pointLinePlot
~~~

![](sw/spl/Help/Image/DyckWord-A.svg)

Plot word interpreted as tree, _n=7_:

~~~spl svg=B
DyckWord(
	[1 1 1 1 0 0 1 0 0 1 1 0 0 0],
	[1 0]
).treePlot
~~~

![](sw/spl/Help/Image/DyckWord-B.svg)

Plot word interpreted as a chord diagram, _n=3_:

~~~spl svg=C
DyckWord([1 0 1 0 1 0])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/DyckWord-C.svg)

Plot word interpreted as a chord diagram, _n=7_:

~~~spl svg=D
DyckWord([1 1 1 1 1 0 0 0 1 0 1 0 0 0])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/DyckWord-D.svg)

Plot word interpreted as a graph on a line:

~~~spl svg=E
DyckWord([1 0 1 1 0 0])
.linearGraphPlot
~~~

![](sw/spl/Help/Image/DyckWord-E.svg)

* * *

See also: dyckWords, isDyckWord

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DyckLanguage.html)
[2](https://mathworld.wolfram.com/DyckPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyck_language)
