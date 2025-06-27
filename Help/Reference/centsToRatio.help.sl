# centsToRatio

- _centsToRatio(x)_

Answer a `SmallFloat` representing the size of the interval represented by the cents value the number _x_ as a ratio.
There are 1200 cents in an octave.

```
>>> 1200.centsToRatio
2

>>> 386.3.centsToRatio
1.25

>>> 386.3.centsToRatio.asFraction
5/4

>>> 400.centsToRatio
2 ^ 1/3

>>> 21.5.centsToRatio.asFraction
81/80

>>> 702.centsToRatio
3/2

>>> 2 ^ (702 / 1200)
3/2
```

The ratio of one cent:

```
>>> 1.centsToRatio
2.nthRoot(1200)

>>> 1.centsToRatio ^ 1200
2
```

Threads over lists:

```
>>> [0 203.9 386.3 498 701.9 1200]
>>> .centsToRatio
[1 9/8 5/4 4/3 3/2 2]

>>> [0 100 200 300 400 500 600]
>>> .centsToRatio
[
	1 1.0594 1.1225 1.1892
	1.2599 1.3348 1.4142
]
```

The inverse is `ratioToCents`:

```
>>> [0.000 203.910 498.045 701.955 996.090]
>>> .centsToRatio
>>> .asFraction
[1/1 9/8 4/3 3/2 16/9]

>>> [1/1 9/8 4/3 3/2 16/9].ratioToCents
[0.000 203.910 498.045 701.955 996.090]
```

* * *

See also: asFraction, ratioToCents, Tuning

Guides: Xenharmonic Functions

References:
_Csound_
[1](https://csound.com/docs/manual/cent.html),
_W_
[1](https://en.wikipedia.org/wiki/Cent_(music)),
_Xenharmonic_
[1](https://en.xen.wiki/w/Cent)
[2](https://en.xen.wiki/w/Ratio)

Unicode: U+000A2 ¢ Cent Sign

Categories: Converting, Tuning
