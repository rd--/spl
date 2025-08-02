# quotientRemainder

- _quotientRemainder(m, n)_

Answer a `List` of the `quotient` and `remainder` from division of _m_ by _n_.

`quotientRemainder` table:

```
>>> { :m :n |
>>> 	n.quotientRemainder(m)
>>> }.table(1:4, 1:5)
[
	1 0; 2 0; 3 0; 4 0; 5 0:;
	0 1; 1 0; 1 1; 2 0; 2 1:;
	0 1; 0 2; 1 0; 1 1; 1 2:;
	0 1; 0 2; 0 3; 1 0; 1 1
]
```

Compute the quotient and remainder of two numbers:

```
>>> 7.quotientRemainder(2)
[3 1]

>>> 19.quotientRemainder(5)
[3 4]
```

At `Fraction`:

```
>>> 15/4.quotientRemainder(2/3)
[5 5/12]
```

At `SmallFloat`:

```
>>> 5.89.quotientRemainder(2.4)
[2 1.09]

>>> (1.e ^ 1.e).quotientRemainder(1.pi)
[4, (1.e ^ 1.e) - 4.pi]
```

Plot the sequence of quotients:

~~~spl svg=A
0:40.collect { :n |
	n.quotientRemainder(5).first
}.discretePlot
~~~

![](sw/spl/Help/Image/quotientRemainder-A.svg)

Plot the sequence of remainders:

~~~spl svg=B
0:40.collect { :n |
	n.quotientRemainder(5).second
}.discretePlot
~~~

![](sw/spl/Help/Image/quotientRemainder-B.svg)

* * *

See also: //, \\, quotient, remainder

Guides: Integer Functions

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:quotRem),
_Mathematica_
[1](https://mathworld.wolfram.com/Quotient.html)
[2](https://mathworld.wolfram.com/Remainder.html)
[3](https://reference.wolfram.com/language/ref/QuotientRemainder.html),
_W_
[1](https://en.wikipedia.org/wiki/Quotient)
[2](https://en.wikipedia.org/wiki/Remainder)

Categories: Math, Arithmetic
