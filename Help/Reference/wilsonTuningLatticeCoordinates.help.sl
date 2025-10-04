# wilsonTuningLatticeCoordinates

- _wilsonTuningLatticeCoordinates(n)_

Answer a 5×2 matrix of the vectors of the Erv Wilson tuning lattice template.

At `one` the first two vectors are unit vectors:

```
>>> 1.wilsonTuningLatticeCoordinates
[
	1 0;
	0 1;
	0.2 0.15;
	-0.15 0.2;
	-0.05 0.1
]
```

At twenty the vectors are scaled for graph paper with ten squares per inch:

```
>>> 20.wilsonTuningLatticeCoordinates
[
	20 0;
	0 20;
	4 3;
	-3 4;
	-1 2
]
```

See θ for each basis:

```
>>> 1.wilsonTuningLatticeCoordinates
>>> .toPolarCoordinates
>>> .transpose
>>> .second
>>> .radiansToDegrees
>>> .round
[0 90 37 127 117]
```

Compare Wilson and Grady tuning lattice templates using a 7-note 13-limit scale
(see `gradyTuningLatticeCoordinates` for equivalent drawing):

~~~spl svg=A
[1/1 21/20 11/10 13/10 7/5 3/2 8/5]
.asRatioTuning
.tuningLatticeGraph(
	[3 5 7 11 13],
	1.wilsonTuningLatticeCoordinates
)
~~~

![](sw/spl/Help/Image/wilsonTuningLatticeCoordinates-A.svg)

* * *

See also: gradyTuningLatticeCoordinates, tuningLatticeGraph, Tuning

Guides: Tuning Functions

References:
_Anaphoria_
[1](https://anaphoria.com/wilsontreasure.html)

Categories: Tuning
