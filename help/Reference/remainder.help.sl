# remainder

- _remainder(aNumber, anotherNumber)_

Remainder defined in terms of _quotient_.

Answer a _Number_ with the same sign as _aNumber_

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

The operator form is _\\\\_:

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

For two finite values x and y, the remainder r of dividing x by y satisfies x = y * q + r, where q is the integer nearest to x / y.

```
>>> let x = 8.625;
>>> let y = 0.75;
>>> let r = x \\ y;
>>> let q = x // y;
>>> y * q + r
x
```

* * *

See also: \\, quotient, remainderBy

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:rem)
[2](https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:mod),
_Mathematica_
[1](https://mathworld.wolfram.com/Remainder.html)
[2](https://reference.wolfram.com/language/ref/QuotientRemainder.html)
[3](https://reference.wolfram.com/language/ref/Mod.html)

Categories: Arithmetic
