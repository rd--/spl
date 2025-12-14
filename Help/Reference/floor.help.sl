# floor

- _floor(x, ε=0)_

Answer the integer nearest _x_ toward negative infinity.

At `Integer`:

```
>>> 1.floor
1

>>> -2.floor
-2
```

At `SmallFloat`:

```
>>> 1.1.floor
1

>>> -2.1.floor
-3
```

At `Fraction`:

```
>>> 3/2.floor
1

>>> -3/2.floor
-2
```

Floor of division:

```
>>> (10 / 3).floor
3

>>> (7 / 2).floor
3

>>> (-10 / 3).floor
-4

>>> (7.3 / 5.5).floor
1
```

Threads over lists:

```
>>> [-2, -1.5 .. 2].floor
[-2 -2 -1 -1 0 0 1 1 2]
```

In the binary case, take the `ceiling` instead if _x_ is within ε:

```
>>> let x = (7 ^ 1:7).geometricMean;
>>> (x.floor, x.floor(1E-12))
(2400, 2401)
```

A Kutz sequence,
OEIS [A007891](https://oeis.org/A007891):

```
>>> 1:20.collect { :n |
>>> 	(n - (2 * (n / 3).floor)) ^ 2
>>> }
[
	 1  4  1  4  9  4  9 16  9 16
	25 16 25 36 25 36 49 36 49 64
]
```

Floor is a staircase function:

~~~spl svg=A
(0 -- 8).functionPlot(floor:/1)
~~~

![](sw/spl/Help/Image/floor-A.svg)

Plot the Gauss map over a subset of the reals:

~~~spl svg=B
(-2 -- 2).discretize(250) { :x |
	(1 / x) - (1 / x).floor
}.scatterPlot
~~~

![](sw/spl/Help/Image/floor-B.svg)

Plot the Gauss map over a subset of the complexes:

~~~spl png=C
[-1J-1 1J1].complexPlot { :z |
	(z ~ 0J0).if {
		z
	} {
		(1 / z) - (1 / z).floor
	}
}
~~~

![](sw/spl/Help/Image/floor-C.png)

Where supported `floor` is displayed as ⌊.

* * *

See also: ceiling, max, min, round

Guides: Integer Functions, Mathematical Functions, Rounding Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Floor),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/ltdot),
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.floor)
[2](https://docs.julialang.org/en/v1/base/math/#Base.fld),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:floor),
_Mathematica_
[1](https://mathworld.wolfram.com/FloorFunction.html)
[2](https://reference.wolfram.com/language/ref/Floor.html),
_Smalltalk_
5.6.2.19,
_W_
[1](https://en.wikipedia.org/wiki/Floor_function)

Unicode: U+0230a ⌊ Left Floor, U+230B ⌋ Right Floor

Categories: Truncating, Rounding
