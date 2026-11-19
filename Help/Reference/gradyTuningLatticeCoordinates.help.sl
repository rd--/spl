# gradyTuningLatticeCoordinates

- _gradyTuningLatticeCoordinates(m, n=8)_

Answer an _n×2_ matrix of the vectors of the Kraig Grady tuning lattice template.
The coordinates are in planar, or Cartesian, form.

At _m=40_ the coordinate are integers.
At _m=1_ the first two vectors are unit vectors.

```
>>> 1.0.gradyTuningLatticeCoordinates
[
	1 0;
	0 1;
	0.325 0.275;
	-0.35 0.45;
	-0.2 0.1;
	-0.125 0.8;
	0.175 0.625;
	0.5 0.15
]
```

At _m=40_ the vectors are scaled for graph paper with twenty squares per inch:

```
>>> 40L.gradyTuningLatticeCoordinates
[
	40 0;
	0 40;
	13 11;
	-14 18;
	-8 4;
	-5 32;
	7 25;
	20 6
]
```

See θ for each basis:

```
>>> 1.0.gradyTuningLatticeCoordinates
>>> .toPolarCoordinates
>>> .transpose
>>> .second
>>> .radiansToDegrees
>>> .round
[0 90 40 128 153 99 74 17]
```

Compare Grady and Wilson tuning lattice templates using a 7-note 13-limit scale
(see `wilsonTuningLatticeCoordinates` for equivalent drawing):

~~~spl svg=A
RatioTuning[
	1/1 21/20 11/10 13/10 7/5 3/2 8/5
].tuningLatticeGraph(
	[3L 5L 7L 11L 13L],
	1.0.gradyTuningLatticeCoordinates
)
~~~

![](Help/Image/gradyTuningLatticeCoordinates-A.svg)

Draw points at each vertex of an _m×m_ _k_ dimensional grid:

~~~spl svg=B
let m = 1L;
let k = 8L;
let v = 1.0.gradyTuningLatticeCoordinates(k);
List(k, [0L m]).coordinateBoundsArray(List(k, 1L))
.flatten(k - 1L)
.collect { :x |
	(x * v).sum
}.PointSet
~~~

![](Help/Image/gradyTuningLatticeCoordinates-B.svg)

* * *

See also: Tuning, tuningLatticeGraph, wilsonTuningLatticeCoordinates

Guides: Tuning Functions, Xenharmonic Functions

References:
_Anaphoria_
[1](https://anaphoria.com/wilsontreasure.html)
