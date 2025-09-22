# floor

- _floor(x)_

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
