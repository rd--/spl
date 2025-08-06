# discriminant

- _discriminant(p)_

Answer the discriminant of the univariate polynomial _p_.

Discriminant of a quadratic:

```
>> UnivariatePolynomial([`c` `b` `a`])
>> .discriminant
(- (* b b) (* (* 4 a) c))

>> [`c` `b` `a`].discriminant
(- (* b b) (* (* 4 a) c))
```

One real root:

```
>>> UnivariatePolynomial([4 4 1])
>>> .discriminant
0
```

Two distinct real roots,
if the discriminant is a perfect square the roots will be rational:

```
>>> UnivariatePolynomial([-4 2 2])
>>> .discriminant
36

>>> UnivariatePolynomial([-2 -5 3])
>>> .discriminant
49

>>> UnivariatePolynomial([-6 3 2])
>>> .discriminant
57

>>> UnivariatePolynomial([2 -10 3])
>>> .discriminant
76

>>> UnivariatePolynomial([-15 -7 2])
>>> .discriminant
169
```

Two complex roots:

```
>>> UnivariatePolynomial([3 -2 1])
>>> .discriminant
-8

>>> UnivariatePolynomial([15 -10 3])
>>> .discriminant
-80
```

Discriminant of a cubic,
the discriminant is zero if and only if at least two roots are equal:

```
>>> UnivariatePolynomial([-1 3 -3 1])
>>> .discriminant
0

>>> UnivariatePolynomial([2 -3 0 1])
>>> .discriminant
0

>>> UnivariatePolynomial([-2 5 -4 1])
>>> .discriminant
0
```

If the discriminant is positive, then the roots are either all real or all non-real:

```
>>> UnivariatePolynomial([-6 11 -6 1])
>>> .discriminant
4
```

If the discriminant is negative, there are two real roots and two complex conjugate roots:

```
>>> UnivariatePolynomial([-1 3 -4 2])
>>> .discriminant
-4

>>> UnivariatePolynomial([-4 6 -4 1])
>>> .discriminant
-16
```

Discriminant of a quartic:

```
>>> UnivariatePolynomial([-30 -71 -18 9 2])
>>> .discriminant
514382400
```

* * *

See also: determinant, isSquareFree, resultant, trace, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/PolynomialDiscriminant.html)
[2](https://reference.wolfram.com/language/ref/Discriminant.html),
_OEIS_
[1](https://oeis.org/A007878),
_W_
[1](https://en.wikipedia.org/wiki/Discriminant)
