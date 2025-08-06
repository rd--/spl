# supersilverRatio

- _supersilverRatio(n)_

Answer _n_ times the supersilver ratio, written ς.

The supersilver ratio is a geometrical proportion close to 75/34:

```
>>> (1.supersilverRatio, 75 / 34)
(2.2056, 2.2059)
```

Its true value is the real solution of the equation _x^3=2*(x^2)+1_:

```
>>> let x = 1.supersilverRatio;
>>> 2 * (x ^ 2) + 1
(x ^ 3)
```

The continued fraction:

```
>>> 1.supersilverRatio
>>> .continuedFraction(11)
[2 4 1 6 2 1 1 1 1 1 1]

>>> [2 4 1 6].convergents
[2/1 9/4 11/5 75/34]
```

The limit ratio of third-order Pell sequences:

```
>>> linearRecurrence([2 0 1], [1 2 4], 12)
[1 2 4 9 20 44 97 214 472 1041 2296 5064]

>>> [44 97 214 472 1041 2296 5064].ratios
[2.2045 2.2061 2.2056 2.2056 2.2056 2.2056]

>>> linearRecurrence([2 0 1], [3 2 4], 12)
[3 2 4 11 24 52 115 254 560 1235 2724 6008]

>>> [115 254 560 1235 2724 6008].ratios
[2.2087 2.2047 2.2054 2.2057 2.2056]
```

Supersilver rectangle:

~~~spl svg=A
Rectangle([0, 0], [1.supersilverRatio 1])
~~~

![](sw/spl/Help/Image/supersilverRatio-A.svg)

Supersilver spiral:

~~~spl svg=B
let b = 1.supersilverRatio.log / 0.5.pi;
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, b)
).Line
~~~

![](sw/spl/Help/Image/supersilverRatio-B.svg)

* * *

See also: silverRatio, supergoldenRatio

Guides: Integer Sequences, Mathematical Constants

Unicode: U+003C2 ς Greek Small Letter Final Sigma

References:
_OEIS_
[1](https://oeis.org/A356035)
[2](https://oeis.org/A008998)
[3](https://oeis.org/A332647),
_W_
[1](https://en.wikipedia.org/wiki/Supersilver_ratio)

Categories: Math, Constant
