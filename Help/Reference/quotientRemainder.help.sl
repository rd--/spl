# quotientRemainder

- _quotientRemainder(aNumber, anotherNumber)_

Answer a `List` of the `quotient` and `remainder` from division of _aNumber_ by _anotherNumber_.

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
```

* * *

See also: //, \\, quotient, remainder

Guides: Integer Functions

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:quotRem),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/QuotientRemainder.html)

Categories: Math, Arithmetic
