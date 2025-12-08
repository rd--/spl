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
>>> 	w.length,
>>> 	w.heightList,
>>> 	w.parenthesization,
>>> 	w.parenthesizationList,
>>> 	w.binaryExpansion,
>>> 	w.integer,
>>> 	w.edgeList,
>>> 	w.restrictedGrowthString,
>>> 	w.setPartition,
>>> 	w.noncrossingSetPartition
>>> )
(
	8,
	[0 1 2 1 2 1 0 1 0],
	'(()())()',
	[[[],[]],[]],
	[1 1 0 1 0 0 1 0],
	210,
	[1 6; 2 3; 4 5; 7 8],
	[1 2 2 1],
	[1 4; 2 3],
	[2; 3 1; 4]
)
```

The Dyck word corresponding to _(())(())_:

```
>>> let w = DyckWord([1 1 0 0 1 1 0 0]);
>>> (
>>> 	w.restrictedGrowthString,
>>> 	w.setPartition,
>>> 	w.noncrossingSetPartition
>>> )
([1 2 1 2], [1 3; 2 4], [2 1; 4 3])
```

Corresponding Łukasiewicz-word:

```
>>> let w = DyckWord(
>>> 	[1 1 0 0 1 0],
>>> 	[1 0]
>>> );
>>> (w.integer, w.lukasiewiczWord)
(50, [2 1 0])

>>> let w = DyckWord(
>>> 	[1 1 1 1 0 0 1 0 0 1 1 0 0 0],
>>> 	[1 0]
>>> );
>>> (w.integer, w.lukasiewiczWord)
(15512, [1 2 2 1 0 0 1])
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
).heightList.pointLinePlot
~~~

![](sw/spl/Help/Image/DyckWord-A.svg)

Plot the word _(((())())(()))_ interpreted as a tree,
_n=7_:

~~~spl svg=B
DyckWord(
	[1 1 1 1 0 0 1 0 0 1 1 0 0 0],
	[1 0]
).treePlot
~~~

![](sw/spl/Help/Image/DyckWord-B.svg)

Plot the word _()()()_ interpreted as a chord diagram,
_n=3_:

~~~spl svg=C
DyckWord([1 0 1 0 1 0])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/DyckWord-C.svg)

Plot the word _((((()))()()))_ interpreted as a chord diagram,
_n=7_:

~~~spl svg=D
DyckWord([1 1 1 1 1 0 0 0 1 0 1 0 0 0])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/DyckWord-D.svg)

Plot the word _()(())_ interpreted as a graph on a line,
_n=3_:

~~~spl svg=E
DyckWord([1 0 1 1 0 0])
.linearGraphPlot
~~~

![](sw/spl/Help/Image/DyckWord-E.svg)

Plot the word _()()(()()(()))_ interpreted as a set partition,
the associated restricted growth string is _1112223_,
the set partition is _123-456-7_:

~~~spl svg=F
DyckWord([1 0 1 0 1 1 0 1 0 1 1 0 0 0])
.partitionPlot
~~~

![](sw/spl/Help/Image/DyckWord-F.svg)

* * *

See also: dyckWords, isDyckWord

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DyckLanguage.html)
[2](https://mathworld.wolfram.com/DyckPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyck_language)
