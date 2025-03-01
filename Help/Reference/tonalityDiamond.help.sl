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

Fifteen limit:

```
>>> 15.tonalityDiamond
[
	1/1 9/8 5/4 11/8 3/2 13/8 7/4 15/8;
	16/9 1/1 10/9 11/9 4/3 13/9 14/9 5/3;
	8/5 9/5 1/1 11/10 6/5 13/10 7/5 3/2;
	16/11 18/11 20/11 1/1 12/11 13/11 14/11 15/11;
	4/3 3/2 5/3 11/6 1/1 13/12 7/6 5/4;
	16/13 18/13 20/13 22/13 24/13 1/1 14/13 15/13;
	8/7 9/7 10/7 11/7 12/7 13/7 1/1 15/14;
	16/15 6/5 4/3 22/15 8/5 26/15 28/15 1/1
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
		6/5 25/24 16/15 9/8 16/15 25/24
	],
	[
		8/7 49/48 36/35 25/24 16/15 21/20
		50/49 21/20 16/15 25/24 36/35 49/48
	]
]
```

The scale is symmetrical within the octave:

```
>>> { :i |
>>> 	let d = i.tonalityDiamond;
>>> 	let r = d.catenate.nub.sort ++ [2];
>>> 	r.collect(ratioToCents:/1).differences.rounded
>>> }.map([5 7])
[
	316 71 112 204 112 71 316;
	231 36 49 71 112 84 35 84 112 71 49 36 231
]
```

* * *

See also: isSuperparticular, octaveReduced

References:
_W_
[1](https://en.wikipedia.org/wiki/Tonality_diamond)
[2](https://en.wikipedia.org/wiki/Otonality_and_utonality),
_Xenharmonic_
[1](https://en.xen.wiki/w/Tonality_diamond)

Further Reading: Meyer 1929, Partch 1949, Rasch 2000
