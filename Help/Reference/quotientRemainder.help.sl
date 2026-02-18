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

Calculate the first few terms of OEIS [A118006](https://oeis.org/A118006):

```
>>> let a = { :n |
>>> 	let b = n % 2;
>>> 	let d = nil;
>>> 	n := (n - 1) >> 1;
>>> 	{
>>> 		[n, d] := quotientRemainder(
>>> 			n, 3
>>> 		);
>>> 		d = 1
>>> 	}.whileTrue;
>>> 	(d = (2 * b)).boole
>>> };
>>> 1:105.collect(a:/1)
[
	0 1 0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1
	0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1 0 1
	1 0 0 1 1 0 1 0 0 1 1 0 1 0 0 1 0 1 1 0
	0 1 0 1 1 0 0 1 1 0 1 0 0 1 0 1 1 0 0 1
	0 1 1 0 0 1 1 0 1 0 0 1 0 1 1 0 0 1 1 0
	1 0 0 1 1
]
```

At `UnivariatePolynomial`,
find the quotient and remainder after dividing one polynomial by another,
the dividend is equal to the product of the quotient and the divisor plus the remainder:

```
>>> let n = Polynomial([1 2 0 0 1]);
>>> let d = Polynomial([1 0 1]);
>>> let [q, r] = n.quotientRemainder(d);
>>> (q, r, (q * d) + r = n)
(
	Polynomial([-1 0 1]),
	Polynomial([2 2]),
	true
)

>>> let n = Polynomial([1 1 1]);
>>> let d = Polynomial([1 2]);
>>> n.quotientRemainder(d)
[
	Polynomial([1/4 1/2]),
	Polynomial([3/4])
]
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

Kimberling’s expulsion array read by antidiagonals,
OEIS [A035486](https://oeis.org/A035486):

~~~spl svg=C
let a = { :n :k |
	(k >= ((2 * n) - 3)).if {
		n + k - 1
	} {
		let [q, r] = quotientRemainder(
			k + 1,
			2
		);
		a(
			n - 1,
			n - 1 + ((1 - (2 * r)) * q)
		)
	}
};
23.antidiagonalArray(a:/2)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/quotientRemainder-C.svg)

* * *

See also: //, \\, quotient, remainder

Guides: Integer Functions, Mathematical Functions

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:quotRem),
_Mathematica_
[1](https://mathworld.wolfram.com/Quotient.html)
[2](https://mathworld.wolfram.com/Remainder.html)
[3](https://reference.wolfram.com/language/ref/QuotientRemainder.html)
[4](https://reference.wolfram.com/language/ref/PolynomialQuotientRemainder.html),
_OEIS_
[1](https://oeis.org/A118006),
_W_
[1](https://en.wikipedia.org/wiki/Quotient)
[2](https://en.wikipedia.org/wiki/Remainder)
[3](https://en.wikipedia.org/wiki/Polynomial_long_division)

Categories: Math, Arithmetic
