# sageSmallGraphCatalogue

- _sageSmallGraphCatalogue(system)_

The small graphs catalogue from the Sage system.
Answers a `Record` of `Graph` values keyed by name.

Count entries:

```
>>> system
>>> .sageSmallGraphCatalogue
>>> .size
565
```

Count the number of entries for each vertex count:

```
>>> system
>>> .sageSmallGraphCatalogue
>>> .collect(vertexCount:/1)
>>> .asIdentityBag
>>> .sortedElements
[
	3 -> 4,
	4 -> 11,
	5 -> 34,
	6 -> 98,
	7 -> 178,
	8 -> 155,
	9 -> 47,
	10 -> 30,
	11 -> 4,
	13 -> 4
]
```

The graph names use _LaTeX_ markup, 'C_4' is C₄,
the cycle graph on four vertices

```
>>> system
>>> .sageSmallGraphCatalogue
>>> .at('C_4')
[1 --- 3, 3 --- 4, 4 --- 2, 2 --- 1].asGraph
```

'K_5' is K₅,
the complete graph on five vertices:

~~~spl svg=A
system
.sageSmallGraphCatalogue
.at('K_5')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-A.svg)

The star graph on three vertices is called a _claw_ graph:

~~~spl svg=B
system
.sageSmallGraphCatalogue
.at('claw')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-B.svg)

The _X_ names are from the Information System on Graph Classes and their Inclusions (ISGCI):

~~~spl svg=C
system
.sageSmallGraphCatalogue
.at('X_{72}')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-C.svg)

The _parapluie_ (umbrella) graph:

~~~spl svg=D
system
.sageSmallGraphCatalogue
.at('parapluie')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-D.svg)

The complement ('\\co') of the graph _E_:

~~~spl svg=E
system
.sageSmallGraphCatalogue
.at('\\co{E}')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-E.svg)

The complement of the union ('\\cup') of the _domino_ graph and the singleton graph (K₁):

~~~spl svg=F
system
.sageSmallGraphCatalogue
.at('\\co{domino \\cup K_1}')
.graphPlot
~~~

![](sw/spl/Help/Image/sageSmallGraphCatalogue-F.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `sageSmallGraphCatalogue` method is `requireLibraryItem` of 'SageSmallGraphCatalogue'.

* * *

See also: Graph

Guides: Graph Functions, Library Catalogue

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ParapluieGraph.html)

Further Reading: Brandstädt 1987
