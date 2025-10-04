# tonalityDiamond

- _tonalityDiamond(n)_

A multiplication table of the odd integers _1, 3 .. n_, reduced to an octave and sorted, with their reciprocals.
The first row contain the harmonics (Otonality) and the first column the subharmonics (Utonality).

Five limit:

```
>>> 5.tonalityDiamond
[
	1/1 5/4 3/2;
	8/5 1/1 6/5;
	4/3 5/3 1/1
]
```

Seven limit:

```
>>> 7.tonalityDiamond
[
	1/1 5/4 3/2 7/4;
	8/5 1/1 6/5 7/5;
	4/3 5/3 1/1 7/6;
	8/7 10/7 12/7 1/1
]
```

Eleven limit:

```
>>> 11.tonalityDiamond
[
	1/1 9/8 5/4 11/8 3/2 7/4;
	16/9 1/1 10/9 11/9 4/3 14/9;
	8/5 9/5 1/1 11/10 6/5 7/5;
	16/11 18/11 20/11 1/1 12/11 14/11;
	4/3 3/2 5/3 11/6 1/1 7/6;
	8/7 9/7 10/7 11/7 12/7 1/1
]
```

Thirteen limit, multiplied out to integers:

```
>>> 13.tonalityDiamond * 8:14
[
	 8  9 10 11 12 13 14;
	16  9 10 11 12 13 14;
	16 18 10 11 12 13 14;
	16 18 20 11 12 13 14;
	16 18 20 22 12 13 14;
	16 18 20 22 24 13 14;
	16 18 20 22 24 26 14
]
```

Ratios between neighbouring pitches are superparticular:

```
>>> { :i |
>>> 	let d = i.tonalityDiamond;
>>> 	d.catenate.nub.sort.ratios
>>> }.map([5 7])
[
	[
		6/5 25/24 16/15
		9/8 16/15 25/24
	],
	[
		 8/7  49/48 36/35
		25/24 16/15 21/20
		50/49 21/20 16/15
		25/24 36/35 49/48
	]
]
```

The scale is symmetrical within the octave:

```
>>> { :i |
>>> 	let d = i.tonalityDiamond;
>>> 	let r = d.catenate.unique ++ [2];
>>> 	r.collect(ratioToCents:/1)
>>> 	.differences
>>> 	.round
>>> }.map([5 7])
[
	316 71 112
	204
	112 71 316
	;
	231 36 49 71 112 84
	35
	84 112 71 49 36 231
]
```

Draw the 15-limit diamond:

~~~spl svg=A
15.tonalityDiamond
.catenate
.unique
.asRatioTuning
.tuningLatticeGraph
~~~

![](sw/spl/Help/Image/tonalityDiamond-A.svg)

* * *

See also: isSuperparticular, octaveReduce

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Tonality_diamond)
[2](https://en.wikipedia.org/wiki/Otonality_and_utonality),
_Xenharmonic_
[1](https://en.xen.wiki/w/Tonality_diamond)

Further Reading: Meyer 1929, Partch 1949, Rasch 2000
