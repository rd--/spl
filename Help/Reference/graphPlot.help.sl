# graphPlot

- _graphPlot(aGraph)_

Plot a complete graph on eight vertices:

~~~spl svg=A
8.completeGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-A.svg)

Plot a random graph of twenty vertices.
The probablity of an edge occuring is 5%:

~~~spl svg=B
Sfc32(379714)
.randomBit(5 / 100, [20 20])
.adjacencyGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-B.svg)

A graph of 32 vertices,
edges indicate that one number can been derived from the other by the insertion of one bit:

~~~spl svg=C
(0 .. 2 ^ 5 - 1).collect { :j |
	let p = j.integerDigits(2);
	(1 .. p.size + 1).collect { :i |
		let q = p.copy;
		q.insertAt(1, i);
		j -> q.fromDigits(2)
	}
}.flatten.nub.asGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-C.svg)

Draw the [Herschel Graph](https://mathworld.wolfram.com/HerschelGraph.html):

~~~spl svg=D
[
	1 3; 1 4; 1 5; 1 6;
	2 3; 2 4; 2 7; 2 8;
	3 11;
	4 10;
	5 9; 5 10;
	6 9; 6 11;
	7 9; 7 10;
	8 9; 8 11
].asGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-D.svg)

Draw the 76-node [Owens graph](https://mathworld.wolfram.com/OwensGraphs.html):

~~~spl svg=E
[
	1 13; 1 16; 1 37; 1 40; 1 52;
	2 11; 2 23; 2 47; 2 71; 2 76;
	3 16; 3 25; 3 35; 3 61; 3 64;
	4 40; 4 49; 4 52; 4 64; 4 76;
	5 6; 5 7; 5 8; 5 9; 5 10;
	6 7; 6 8; 6 14; 6 15;
	7 9; 7 12; 7 14;
	8 10; 8 13; 8 15;
	9 10; 9 11; 9 12;
	10 11; 10 13;
	11 12; 11 13;
	12 14; 12 16;
	13 15;
	14 15; 14 16;
	15 16;
	17 18; 17 19; 17 20; 17 21; 17 22;
	18 19; 18 20; 18 26; 18 27;
	19 21; 19 24; 19 26;
	20 22; 20 25; 20 27;
	21 22; 21 23; 21 24;
	22 23; 22 25;
	23 24; 23 25;
	24 26; 24 28;
	25 27;
	26 27; 26 28;
	27 28;
	28 59; 28 73;
	29 30; 29 31; 29 32; 29 33; 29 34;
	30 31; 30 32; 30 38; 30 39;
	31 33; 31 36; 31 38;
	32 34; 32 37; 32 39;
	33 34; 33 35; 33 36;
	34 35; 34 37; 35 36;
	35 37;
	36 38; 36 40;
	37 39;
	38 39; 38 40;
	39 40;
	41 42; 41 43; 41 44; 41 45; 41 46;
	42 43; 42 44; 42 50; 42 51;
	43 45; 43 48; 43 50;
	44 46; 44 49; 44 51;
	45 46; 45 47; 45 48;
	46 47; 46 49;
	47 48; 47 49;
	48 50; 48 52;
	49 51;
	50 51; 50 52;
	51 52;
	53 54; 53 55; 53 56; 53 57; 53 58;
	54 55; 54 56; 54 62; 54 63;
	55 57; 55 60; 55 62;
	56 58; 56 61; 56 63;
	57 58; 57 59; 57 60;
	58 59; 58 61; 59 60;
	59 61;
	60 62; 60 64;
	61 63;
	62 63; 62 64;
	63 64;
	65 66; 65 67; 65 68; 65 69; 65 70;
	66 67; 66 68; 66 74; 66 75;
	67 69; 67 72; 67 74;
	68 70; 68 73; 68 75;
	69 70; 69 71; 69 72;
	70 71; 70 73;
	71 72; 71 73;
	72 74; 72 76;
	73 75;
	74 75; 74 76;
	75 76
].asGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-E.svg)

* * *

See also: discretePlot, functionPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

Guides: Graph Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GraphPlot.html)

Categories: Plotting
