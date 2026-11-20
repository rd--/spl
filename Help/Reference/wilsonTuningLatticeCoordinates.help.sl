# wilsonTuningLatticeCoordinates

- _wilsonTuningLatticeCoordinates(n)_

Answer a 5×2 matrix of the vectors of the Erv Wilson tuning lattice template.

At `one` the first two vectors are unit vectors:

```
>>> 1L.wilsonTuningLatticeCoordinates
[
	1/1 0/1;
	0/1 1/1;
	1/5 3/20;
	-3/20 1/5;
	-1/20 1/10
]
```

At twenty the vectors are scaled for graph paper with ten squares per inch:

```
>>> 20L.wilsonTuningLatticeCoordinates
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
>>> 1.0.wilsonTuningLatticeCoordinates
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
RatioTuning[
	1/1 21/20 11/10 13/10 7/5 3/2 8/5
].tuningLatticeGraph(
	[3 5 7 11 13],
	1L.wilsonTuningLatticeCoordinates
)
~~~

![](Help/Image/wilsonTuningLatticeCoordinates-A.svg)

* * *

See also: Tuning, gradyTuningLatticeCoordinates, tuningLatticeGraph

Guides: Tuning Functions, Xenharmonic Functions

References:
_Anaphoria_
[1](https://anaphoria.com/wilsontreasure.html)
