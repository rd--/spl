# gradyTuningLatticeCoordinates

- _gradyTuningLatticeCoordinates(n)_

Answer an 8×2 matrix of the vectors of the Kraig Grady tuning lattice template.
The coordinates are in planar, or Cartesian, form.

At `one` the first two vectors are unit vectors:

```
>>> 1.gradyTuningLatticeCoordinates
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

At fourty the vectors are scaled for graph paper with twenty squares per inch:

```
>>> 40.gradyTuningLatticeCoordinates
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

Compare Grady and Wilson tuning lattice templates using a 7-note 13-limit scale
(see `wilsonTuningLatticeCoordinates` for equivalent drawing):

~~~spl svg=A
[1/1 21/20 11/10 13/10 7/5 3/2 8/5]
.asRatioTuning
.tuningLatticeGraph(
	[3 5 7 11 13],
	1.gradyTuningLatticeCoordinates
)
~~~

![](sw/spl/Help/Image/gradyTuningLatticeCoordinates-A.svg)

* * *

See also: wilsonTuningLatticeCoordinates, tuningLatticeGraph, Tuning

Guides: Tuning Functions

References:
_Anaphoria_
[1](https://anaphoria.com/wilsontreasure.html)

Categories: Tuning
