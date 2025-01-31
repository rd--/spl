# quotient

- _quotient(aNumber, anotherNumber)_

Integer quotient defined by division with truncation toward zero.

```
>>> -9.quotient(4)
-2

>>> -0.9.quotient(0.4)
-2
```

The operator form is `//`:

```
>>> 17 // 5
3

>>> 13 // 4
3
```

Fractions:

```
>>> 19/3 // 5/2
2
```

Inexact numbers:

```
>>> 4.56 // 2.5
1
```

Quotient threads elementwise over lists:

```
>>> [1 2 3 4 5 6 7 8 9 10] // 3
[0 0 1 1 1 2 2 2 3 3]
```

Quotient is equivalent to `floor` of division for integers:

```
>>> 83 // 16
5

>>> (83 / 16).floor
5
```

For positive integers _quotient(m, n) + fractionPart(m / n)_ is always equal to _m / n_:

```
>>> (24 // 7) + (24 / 7).fractionPart
(24 / 7)
```

Division by `zero` is an `error`:

```
>>> { 3 // 0 }.ifError { true }
true
```

Plot the sequence of quotients:

~~~spl svg=A
1:50.functionPlot { :n | n // 8 }
~~~

![](sw/spl/Help/Image/quotient-A.svg)

`remainder` answers the remainder from this division.

* * *

See also: //, quotientBy, remainder

References:
_Haskell_:
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:quot)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:div),
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerDivision.html)
[2](https://mathworld.wolfram.com/Quotient.html)
[3](https://reference.wolfram.com/language/ref/Quotient.html),
_Smalltalk_
5.6.2.26

Categories: Math, Arithmetic
