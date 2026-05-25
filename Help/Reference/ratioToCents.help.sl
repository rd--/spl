# ratioToCents

- _ratioToCents(n/d)_

Answer the size of the interval represented by the ratio _n/d_ in _cents_.
There are 1200 cents in an octave.

The perfect fifth is 702 cents:

```
>>> 3/2.ratioToCents
701.995

>>> (3 / 2).log2 * 1200
701.995
```

The unison is 0 cents and the octave is 1200 cents:

```
>>> 1.ratioToCents
0

>>> 2.ratioToCents
1200
```

The equal tempered major fourth,
and hence tone and semitone:

```
>>> 2.cubeRoot.ratioToCents
400

>>> let a = [1 2.cubeRoot].geometricMean;
>>> let b = [1 a].geometricMean;
>>> [a b].ratioToCents
[200 100]
```

One step in 16-EDO is 75¢:

```
>>> (2 ^ (1 / 16)).ratioToCents
75
```

Threads over lists:

```
>>> [1 9/8 5/4 4/3 3/2 2]
>>> .ratioToCents
>>> .round
[0 204 386 498 702 1200]

>>> [40/39 39/38 36/35 28/27]
>>> .ratioToCents
>>> .round
[44 45 49 63]

>>> [1/1 9/8 5/4 4/3 3/2 5/3 15/8]
>>> .ratioToCents
>>> .round
[0 204 386 498 702 884 1088]
```

The eight tone scale given by harmonics eight through fifteen:

```
>>> (8:15 / 8).ratioToCents.round
[0 204 386 551 702 841 969 1088]
```

The scales of the first five octaves of the harmonic series:

```
>>> (1:32.takeList(
>>> 	[1 2 4 8 16]
>>> ) / [1 2 4 8 16])
>>> .ratioToCents
>>> .round
[
	0
	;
	0
	702
	;
	0 386
	702 969
	;
	0 204 386 551
	702 841 969 1088
	;
	0 105 204 298 386 471 551 628
	702 773 841 906 969 1030 1088 1145
]
```

At ratio with large numerator and denominator,
the temperate half-tone is said to be the interval from the 1,000,000,000 to the 1,059,463,094th harmonic (Daniélou 1943):

```
>>> 1_059_463_094/1_000_000_000
>>> .ratioToCents
100
```

The interval of two octaves plus a major third divided into twenty-five equal parts,
the scale Stockhausen’s _Studie II_:

```
>>> 5.nthRoot(25).ratioToCents
111.45

>>> 5.ratioToCents / 25
111.45
```

The step sizes of the Carlos’s Alpha, Beta and Gamma scales:

```
>>> (3 / 2).nthRoot(9).ratioToCents
78

>>> (9 / 4).nthRoot(18).ratioToCents
78

>>> 1200 / 78
15.385

>>> 4 * 78
312

>>> (3 / 2).nthRoot(11).ratioToCents
63.81

>>> (9 / 4).nthRoot(22).ratioToCents
63.81

>>> 1200 / 63.81
18.805

>>> (3 / 2).nthRoot(20).ratioToCents
35.1

>>> 1200 / 35.1
34.190
```

Plot step sizes of the `prime` harmonic series in cents:

~~~spl svg=A
2:39.prime
.ratios
.ratioToCents
.discretePlot
~~~

![](Help/Image/ratioToCents-A.svg)

* * *

See also: centsToRatio, Tuning

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cent_(music))
_Xenharmonic_
[1](https://en.xen.wiki/w/Cent)

Categories: Converting, Tuning
