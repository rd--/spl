# degree

- _degree(aNumber)_

Answer _aNumber_ times _degree_, the constant representing the number of radians in one degree,
approximately equal to _0.01745_.

```
>>> 1.degree
(2.pi / 360)

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
answers the is the largest exponent of the polynomial:

```
>>> UnivariatePolynomial([1 2 3])
>>> .degree
2
```

Where supported `degree` is displayed as °.

* * *

See also: angleVector, arcMinute, arcSecond, arcSin, degrees, fromDms, pi, sin

Guides: Mathematical Constants, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Degree.html)
[2](https://reference.wolfram.com/language/ref/Degree.html),
_W_
[1](https://en.wikipedia.org/wiki/Degree_(angle))

Unicode: U+00b0 ° Degree Sign

Categories: Math, Constant
