# chordDiagrams

- _chordDiagrams(n)_

Answer a list of the chord diagrams of length _n_.

Enumerate and count chord diagrams where _n=3_:

```
>>> 3.chordDiagrams
>>> .collect(edgeList:/1)
[
	1 2; 3 4; 5 6:;
	1 2; 3 5; 4 6:;
	1 2; 3 6; 4 5:;
	1 3; 2 5; 4 6:;
	1 4; 2 5; 3 6
]

>>> 3.chordDiagramCount
5
```

Enumerate and count chord diagrams where _n=4_:

```
>>> 4.chordDiagrams
>>> .collect(edgeList:/1)
[
	1 2; 3 4; 5 6; 7 8:;
	1 2; 3 4; 5 7; 6 8:;
	1 2; 3 4; 5 8; 6 7:;
	1 2; 3 5; 4 7; 6 8:;
	1 2; 3 5; 4 8; 6 7:;
	1 2; 3 6; 4 7; 5 8:;
	1 2; 3 6; 4 8; 5 7:;
	1 2; 3 7; 4 6; 5 8:;
	1 2; 3 7; 4 8; 5 6:;
	1 2; 3 8; 4 6; 5 7:;
	1 2; 3 8; 4 7; 5 6:;
	1 3; 2 4; 5 7; 6 8:;
	1 3; 2 5; 4 7; 6 8:;
	1 3; 2 6; 4 7; 5 8:;
	1 3; 2 6; 4 8; 5 7:;
	1 4; 2 6; 3 7; 5 8:;
	1 4; 2 7; 3 6; 5 8:;
	1 5; 2 6; 3 7; 4 8
]

>>> 4.chordDiagramCount
18
```

Enumerate and count chord diagrams where _n=5_:

```
>>> 5.chordDiagrams.size
105

>>> 5.chordDiagramCount
105
```

* * *

See also: ChordDiagram, chordDiagramCount

Guides: Combinatorial Functions

Further Reading: Sawada 2002

