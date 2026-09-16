# remainder

- _remainder(m, n)_

Remainder defined in terms of `quotient`.
Answers a `Number` with the same sign as _m_.
The operator form is `\\`.

```
>>> 9.remainder(4)
1

>>> -9.remainder(4)
-1

>>> 0.9.remainder(0.5)
0.4

>>> 8.625.remainder(0.75)
0.375
```

The operator form is `\\`:

```
>>> 9 \\ 4
1

>>> -9 \\ 4
-1

>>> 0.9 \\ 0.5
0.4

>>> 8.625 \\ 0.75
0.375
```

Quotient & remainder:

```
>>> (7 // 2, 7 \\ 2)
(3, 1)
```

For two finite values _x_ and _y_,
the remainder _r_ of dividing _x_ by _y_ satisfies _x = y * q + r_,
where _q_ is the integer nearest to _x / y_.

```
>>> let x = 8.625;
>>> let y = 0.75;
>>> let r = x \\ y;
>>> let q = x // y;
>>> y * q + r
x
```

Detect odd numbers in a given list of numbers:

```
>>> 7.iota \\ 2
[1 0 1 0 1 0 1]
```

Detect perfect multiples in a given list of numbers:

```
>>> 7.iota \\ 3 =.each 0
[false false true false false true false]
```

Special values:

```
>>> remainder(-0, 1)
-0

>>> remainder(5.1, Infinity)
5.1

>>> remainder(5.1, 0).isNaN
true
```

Compare to `ieeeRemainder`:

```
>>> remainder(5.5, 2)
1.5

>>> ieeeRemainder(5.5, 2)
-0.5

>>> remainder(5.1, 3)
2.1

>>> ieeeRemainder(5.1, 3)
-0.9

>>> remainder(-5.1, 3)
-2.1

>>> ieeeRemainder(-5.1, 3)
0.9
```

* * *

See also: //, \\, quotient, quotientRemainder, remainderBy

Guides: Mathematical Functions

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:rem)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:mod),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bar#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Remainder.html)
[2](https://reference.wolfram.com/language/ref/QuotientRemainder.html)
[3](https://reference.wolfram.com/language/ref/Mod.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.quorem.html),
_Smalltalk_
5.6.2.30,
_W_
[1](https://en.wikipedia.org/wiki/Remainder)
[2](https://en.wikipedia.org/wiki/Euclidean_division)

Categories: Arithmetic
