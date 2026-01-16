# quotient

- _quotient(m, n)_

Answer the integer quotient of _m_ and _n_,
defined by division with truncation toward zero.

```
>>> -9.quotient(4)
-2

>>> -0.9.quotient(0.4)
-2
```

The operator form is `//`:

```
>>> 9 // 4
2

>>> -5 // 3
-1

>>> 5 // 2
2

>>> 17 // 5
3

>>> 13 // 4
3
```

Quotient table:

```
>>> //.table(1:10, 2:4).transpose
[
	0 1 1 2 2 3 3 4 4 5;
	0 0 1 1 1 2 2 2 3 3;
	0 0 0 1 1 1 1 2 2 2
]
```

At `LargeInteger`:

```
>>> 3213213213213213432453243L
>>> //
>>> 123434343439L
26031760073331L
```

At `Fraction`:

```
>>> 19/3 // 5/2
2

>>> 19/3.quotient(5/2)
2
```

At `SmallFloat`, i.e. inexact numbers:

```
>>> 4.56 // 2.5
1

>>> let e = 1.e;
>>> (e ^ (e ^ e)) // 1.pi
1214122
```

Quotient threads elementwise over lists:

```
>>> [1 2 3 4 5 6 7 8 9 10] // 3
[0 0 1 1 1 2 2 2 3 3]

>>> [-5 .. 5] // 3
[-1 -1 -1 0 0 0 0 0 1 1 1]
```

Quotient is equivalent to `floor` of division for integers:

```
>>> 83 // 16
5

>>> (83 / 16).floor
5
```

For positive integers _quotient(m, n) + fractionalPart(m / n)_ is always equal to _m / n_:

```
>>> (24 // 7) + (24 / 7).fractionalPart
(24 / 7)
```

Division by `zero` is an `error`:

```
>>> { 3 // 0 }.hasError
true
```

Molien series for four-dimensional representation of S₃,
OEIS [A000601](https://oeis.org/A000601):

```
>>> let p = Polynomial([0 66 21 2]);
>>> 0:13.collect { :n |
>>> 	(p[n] // 72) + 1
>>> }
[1 2 4 7 11 16 23 31 41 53 67 83 102 123]
```

Plot the sequence of quotients:

~~~spl svg=A
1:50.functionPlot { :n |
	n.quotient(8)
}
~~~

![](sw/spl/Help/Image/quotient-A.svg)

Plot the quotient of two integers:

~~~spl svg=B
{ :m :n |
	m.quotient(n)
}.table(1:10, 1:10).matrixPlot
~~~

![](sw/spl/Help/Image/quotient-B.svg)

Plot the quotient of a function:

~~~spl svg=C
(0 -- 2).functionPlot { :x |
	(x ^ 2)
	.quotient(x - 1)
	.clip([-9 9])
}
~~~

![](sw/spl/Help/Image/quotient-C.svg)

At `Symbol`:

```
>> `m` // `n`
(quotient m n)
```

`remainder` answers the remainder from this division.

* * *

See also: //, quotientBy, quotientRemainder, remainder

Guides: Integer Functions, Mathematical Functions

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:quot)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:div),
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.div),
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerDivision.html)
[2](https://mathworld.wolfram.com/Quotient.html)
[3](https://reference.wolfram.com/language/ref/Quotient.html),
_OEIS_
[1](https://oeis.org/A000601),
_Smalltalk_
5.6.2.26

Categories: Math, Arithmetic
