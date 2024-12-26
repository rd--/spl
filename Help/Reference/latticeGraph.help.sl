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

~~~
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

~~~
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

~~~
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

~~~
[128 144 156 171 192 208 228]
.asRatioTuning
.latticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-D.svg)

_Rationale_:
While the unary case is useful for drawing simple examples,
it is more usual to calculate the required primes vector.

* * *

See also: asLineDrawing, asRatioTuning, gradyLatticeCoordinates, Graph, latticePrimes, wilsonLatticeCoordinates

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Harmonic_lattice_diagram)

Categories: Tuning
