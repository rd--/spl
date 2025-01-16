# tenneyHeight

- _tenneyHeight(aFraction, base)_
- _tenneyHeight(alpha)_ ⟹ _tenneyHeight(alpha, 2)_

Answer the Tenney harmonic distance for _aFraction_.

The `log` in the indicated base (2 in the unary case) of the `benedettiHeight`:

```
>>> 81/64.tenneyHeight
12.340

>>> (81 * 64).log2
12.34
```

The heights of three increasingly _dissonant_ intervals:

```
>>> 3/2.tenneyHeight
2.585

>>> 16/15.tenneyHeight
7.907

>>> 1.pythagoreanComma.tenneyHeight
38.020
```

Threads over lists:

```
>>> [
>>> 	1/1 2/1 3/2 4/3 5/3
>>> 	5/4 7/4 6/5 9/7 13/11
>>> ].tenneyHeight
[
	0 1 2.585 3.585 3.907
	4.322 4.807 4.907 5.977 7.16
]
```

Plot for a number of simple just ratios within the octave:

~~~spl svg=A
[
	1/1 9/8 7/6 6/5 5/4
	21/16 7/5 4/3 11/8 3/2
	10/7 13/8 8/5 5/3 27/16
	7/4 9/5 15/8
].tenneyHeight.discretePlot
~~~

![](sw/spl/Help/Image/tenneyHeight-A.svg)

* * *

See also: benedettiHeight, eulerGradusSuavitatis, keesSemiHeight

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Tenney_height)

Categories: Tuning
