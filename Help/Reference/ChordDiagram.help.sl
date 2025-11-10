# ChordDiagram

- _ChordDiagram([l₁ l₂ …])_
- _ChordDiagram([v₁ v₂; …])_

A `Type` representing a chord diagram.

In the `List` case the diagram is given as a length vector:

```
>>> ChordDiagram([6 2 3 6 3 5 2 5])
>>> .edgeList
[1 7; 2 4; 3 6; 5 8]
```

In the `Matrix` case the diagram is given as an edge list:

```
>>> ChordDiagram([1 7; 2 4; 3 6; 5 8])
>>> .lengthVector
[6 2 3 6 3 5 2 5]
```

Plot chord diagram, _n=4_:

~~~spl svg=A
ChordDiagram([1 7; 2 4; 3 6; 5 8])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/ChordDiagram-A.svg)

Plot chord diagram, _n=3_:

~~~spl svg=B
ChordDiagram([1 2; 3 5; 4 6])
.chordDiagramPlot
~~~

![](sw/spl/Help/Image/ChordDiagram-B.svg)

* * *

See also: chordDiagramCount, chordDiagramPlot, chordDiagrams

Guides: Combinatorial Functions

References:
_nLab_
[1](https://ncatlab.org/nlab/show/chord+diagram),
_W_
[1](https://en.wikipedia.org/wiki/Chord_diagram_(mathematics))
