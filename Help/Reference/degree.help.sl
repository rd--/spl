# degree

- _degree(x)_

At `Number`,
answer _x_ times the constant representing the number of radians in one degree,
approximately equal to _0.01745_.

```
>>> 1.degree
1/180.pi

>>> 360.degree
2.pi
```

One degree is divided into sixty _arc minutes_,
which are in turn divided into sixty _arc seconds_:

```
>>> 1.degree
60.arcMinute

>>> 1.degree
(60 * 60).arcSecond
```

At `UnivariatePolynomial`,
answer the largest exponent of the polynomial:

```
>>> UnivariatePolynomial([1 2 3])
>>> .degree
2
```

Where supported `degree` is displayed as °.

* * *

See also: angleVector, arcMinute, arcSecond, arcSin, degrees, fromDms, pi, sin

Guides: Mathematical Constants, Polynomial Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Degree.html)
[2](https://reference.wolfram.com/language/ref/Degree.html),
_W_
[1](https://en.wikipedia.org/wiki/Degree_(angle))

Unicode: U+00b0 ° Degree Sign

Categories: Math, Constant
