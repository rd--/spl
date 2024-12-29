# latticeGraph

- _latticeGraph(aRatioTuning)_
- _latticeGraph(aRatioTuning, primesList, unitVectorList)_

Answer a `Graph` of _aRatioTuning_.

In the ternary case,
_primesList_ and _unitVectorList_,
which should be of equal size,
specify the unit lattice.

The vertices of the graph are labelled with their coordinates,
allowing the graph to be drawn using `asLineDrawing`.

A 7-note 7-limit tuning:

~~~spl svg=A
[1/1 8/7 6/5 21/16 3/2 8/5 7/4]
.asRatioTuning
.latticeGraph(
	[3 5 7],
	[1 0; 0 1; 0.2 0.15]
)
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-A.svg)

A 22-note 11-limit tuning:

~~~spl svg=B
[
	1/1 33/32 16/15 11/10 25/22
	7/6 40/33 5/4 9/7 4/3
	11/8 99/70 16/11 3/2 14/9
	8/5 33/20 12/7 44/25 20/11
	15/8 64/33
]
.asRatioTuning
.latticeGraph(
	[3 5 7 11],
	[1 0; 0 1; 0.2 0.15; -0.15 0.2]
)
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-B.svg)

The `divisors` set of sixty,
drawn on a lattice including the octave,
where the _y_ axis indicates pitch in logarithmic space:

~~~spl svg=C
[1 2 3 4 5 6 10 12 15 20 30 60]
.asRatioTuning
.latticeGraph(
	[2 3 5],
	[-0.69 0.69; 0.00 1.10; 1.61 1.61]
)
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-C.svg)

In the unary case the primes list is either _3 5 7 11 13 17 19 23_,
or is derived from the tuning using `latticePrimes`,
and the unit vector is that of Kraig Grady,
given by `gradyLatticeCoordinates`.

A 7-note 19-limit tuning:

~~~spl svg=D
[128 144 156 171 192 208 228]
.asRatioTuning
.latticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-D.svg)

A 17-tone 13-limit scale by Larry Polansky for the Harrison-Colvig transfer harp:

~~~spl svg=E
[
	65/64 35/32 9/8 7/6
	6/5 39/32 5/4 21/16 4/3
	3/2 25/16 13/8 5/3 27/16
	7/4 15/8 2/1
].asRatioTuning
.latticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-E.svg)

A 47-tone 11-limit scale by Paul Johnson,
_3,7,11_ is drawn upon what is ordinarily the _3,5,7_ lattice:

~~~spl svg=F
[
	99/98
	64/63
	33/32
	28/27
	22/21 256/231
	9/8 112/99
	8/7 297/256
	7/6 33/28 32/27 77/64
	14/11
	9/7 128/99 21/16 297/224
	4/3 693/512 49/36
	11/8
	16/11 72/49 1024/693
	3/2 448/297 32/21 99/64
	14/9
	11/7 128/77 27/16 56/33
	12/7 512/297
	7/4 99/56
	16/9 231/128
	21/11 27/14 64/63 63/32 196/99
	2/1
].asRatioTuning.latticeGraph(
	[3 7 11],
	[1 0; 0 1; 0.2 0.15]
)
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-F.svg)

Draw a _1,3,5,7,11,13_ diamond on a circular lattice:

~~~spl svg=G
let m = [4.35 4.25 3.5 3.35 3.75];
let v = 5.circlePoints(1, pi / 4) * m;
let n = [1 3 5 7 11 13];
[n, n].tuples.collect { :each |
	let [n, d] = each;
	Fraction(n, d)
}.nub.sort.asRatioTuning.latticeGraph(
	[3 5 7 11 13],
	v
)
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-G.svg)

_Rationale_:
While the unary case is useful for drawing simple examples,
it is more usual to calculate the required primes vector.

* * *

See also: asLineDrawing, asRatioTuning, gradyLatticeCoordinates, Graph, latticePrimes, wilsonLatticeCoordinates

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Harmonic_lattice_diagram),
_Xenharmonikon_
[1](https://www.xenharmonikon.org/2020/04/27/the-axial-chord-a-basis-for-2-3-7-11-harmony/)

Categories: Tuning
