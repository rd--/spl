# ceiling

- _ceiling(x)_

Answer the integer nearest _x_ toward infinity.

At integers:

```
>>> 1.ceiling
1

>>> -2.ceiling
-2
```

At real numbers:

```
>>> 1.1.ceiling
2

>>> -2.1.ceiling
-2

>>> (3 / 2).ceiling
2

>>> (-3 / 2).ceiling
-1
```

At `Fraction`:

```
>>> 3/2.ceiling
2

>>> -3/2.ceiling
-1
```

Threads over lists:

```
>>> [-2, -1.5 .. 2].ceiling
[-2 -1 -1 0 0 1 1 2 2]
```

Where supported `ceiling` is displayed as ⌈.

* * *

See also: floor, max, min, round, roundUp

Guides: Rounding Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Ceiling),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:ceiling),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gtdot),
_Mathematica_
[1](https://mathworld.wolfram.com/CeilingFunction.html)
[2](https://reference.wolfram.com/language/ref/Ceiling.html),
_Smalltalk_
5.6.2.18,
_W_
[1](https://en.wikipedia.org/wiki/Ceiling_function)

Unicode: U+02308 ⌈ Left Ceiling, U+2309 ⌉ Right Ceiling

Categories: Truncating and rounding
