# randomChoice

- _randomChoice(e, r, shape)_

Select _shape_ elements at random from _e_ using the random number generator _r_.

A list of twenty random choices:

```
>>> let r = Sfc32(10841);
>>> [1 2 3].randomChoice(r, [20])
[
	2 3 3 2 3 1 3 3 1 2
	3 1 1 1 3 1 3 3 2 1
]
```

A 4×3 array of random choices:

```
>>> let r = Sfc32(81349);
>>> [1 2 3].randomChoice(r, [4 3])
[
	2 2 3;
	3 2 1;
	1 3 2;
	3 3 1
]
```

Generate a random string:

```
>>> let r = Sfc32(37914);
>>> ['A' 'C' 'G' 'T'].randomChoice(r, [25])
>>> .stringCatenate
'TTCGGAGGGCCCCGCAGATCTAAGT'
```

Generate a random 9×9 matrix of `zero` and `one` entries:

```
>>> let r = Sfc32(97415);
>>> [0 1].randomChoice(r, [9 9])
[
	0 0 1 0 0 1 0 0 0;
	1 1 1 0 0 1 0 0 1;
	0 0 0 1 0 0 1 0 1;
	0 1 1 1 0 1 0 1 1;
	1 0 0 1 1 1 0 1 0;
	0 1 1 1 0 1 0 1 1;
	1 1 1 1 0 1 0 1 1;
	1 1 1 0 0 0 0 1 0;
	0 0 1 0 0 1 1 1 1
]
```

At `Range` of integer values:

```
>>> let r = Sfc32(48051);
>>> 1:9.randomChoice(r, [3 3])
[
	7 8 6;
	2 2 3;
	8 5 6
]
```

At `Range` of real values:

```
>>> let r = Sfc32(87425);
>>> (1, 1.1 .. 5).randomChoice(r, [3 3])
[
	2.8 2.7 4.0;
	4.5 4.9 3.5;
	2.3 1.3 4.5
]
```

At `List`:

```
>>> let r = Sfc32(23984);
>>> [1 3 5 7 9].randomChoice(r, [3 3])
[
	5 7 3;
	3 1 9;
	7 1 5
]
```

At `Record`:

```
>>> let r = Sfc32(19401);
>>> let c = (w: 0, x: 1, y: 2, z: 3);
>>> c.randomChoice(r, [3 3])
[
	1 0 3;
	0 3 2;
	2 3 2
]
```

At `IdentityMultiset` makes a weighted choice:

```
>>> let r = Sfc32(13952);
>>> [1 3 3 3 5 5 5 5 5]
>>> .asIdentityMultiset
>>> .randomChoice(r, [3 3])
[
	3 3 5;
	5 5 5;
	3 5 1
]
```

At `IdentitySet`:

```
>>> let r = Sfc32(31052);
>>> let c = [1 .. 9].asIdentitySet;
>>> c.randomChoice(r, [3 3])
[
	4 8 5;
	8 3 9;
	3 7 2
]
```

At `WeightedData`:

```
>>> let r = Sfc32(19743);
>>> WeightedData(
>>> 	[1 2 3 4],
>>> 	[2 2 5 1]
>>> ).randomChoice(r, [100])
>>> .asIdentityMultiset
>>> .sortedElements
[1 -> 18, 2 -> 17, 3 -> 50, 4 -> 15]
```

Plot a random walk with steps of unit length:

~~~spl svg=A
let r = Sfc32(28974);
[-1 1].randomChoice(r, 50)
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/randomChoice-A.svg)

Plot at `Range`:

~~~spl svg=B
let r = Sfc32(902132);
(1, 3 .. 9)
.randomChoice(r, [43])
.stepPlot
~~~

![](sw/spl/Help/Image/randomChoice-B.svg)

Plot at `IdentityMultiset`:

~~~spl svg=C
let r = Sfc32(134717);
[1 3 3 3 5 5 5 5 5]
.asIdentityMultiset
.randomChoice(r, [43])
.stepPlot
~~~

![](sw/spl/Help/Image/randomChoice-C.svg)

Planar random lattice walk with eight directions:

~~~spl svg=D
let r = Sfc32(789417);
[-1 0 1]
.randomChoice(r, [99 2])
.accumulate
.Line
~~~

![](sw/spl/Help/Image/randomChoice-D.svg)

Volumetric random lattice walk:

~~~spl svg=E
let r = Sfc32(192133);
[-1 0 1]
.randomChoice(r, [99 3])
.accumulate
.Line
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/randomChoice-E.svg)

Random walk on a hexagonal lattice:

~~~spl svg=F
let r = Sfc32(379379);
1:6.collect { :i |
	let phase = (2.pi * i / 6);
	[phase.sin, phase.cos]
}
.randomChoice(r, [99])
.accumulate
.Line
~~~

![](sw/spl/Help/Image/randomChoice-F.svg)

Random array of three shades of colours (greyscale):

~~~spl svg=G
let r = Sfc32(131939);
[1 2 3].randomChoice(r, [17 17])
.matrixPlot
~~~

![](sw/spl/Help/Image/randomChoice-G.svg)

* * *

See also: anyOne, atRandom, randomInteger, RandomNumberGenerator, randomSample, randomWeightedChoice

Guides: Random Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Base.rand),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html),
_Mathworks_
[1](https://mathworks.com/help/stats/randsample.html),
_Python_
[1](https://docs.python.org/3/library/random.html#random.choices),
_R_
[1](https://search.r-project.org/R/refmans/base/html/sample.html)

Categories: Random
