# silverRatio

- _silverRatio(n)_

Answer _n_ × the silver ratio, _√2 + 1_, usually written as δs or λ or σ.

```
>>> 1.silverRatio
2.4142
```

δs is the square root of two plus one:

```
>>> 1.silverRatio
2.sqrt + 1
```

The silver ratio is the `metallicMean` of two:

```
>>> 2.metallicMean
2.4142
```

The `reciprocal` of δs is its `fractionPart`:

```
>>> 1.silverRatio.reciprocal
1.silverRatio.fractionPart
```

As a continued fraction:

```
>>> 1.silverRatio
>>> .continuedFraction(14)
[2 2 2 2 2 2 2 2 2 2 2 2 2 2]

>>> 1.silverRatio.squared
>>> .continuedFraction(14)
[5 1 4 1 4 1 4 1 4 1 4 1 4 1]
```

The silver ratio is the limiting ratio of consecutive Pell numbers:

```
>>> 19.pellNumber / 18.pellNumber
1.silverRatio
```

As the ⁠superstable fixed point of an iteration:

```
>>> { :x |
>>> 	0.5 * (x.squared + 1) / (x - 1)
>>> }.fixedPoint(2.5, ~)
1.silverRatio
```

Silver rectangle:

~~~spl svg=A
Rectangle([0, 0], [1.silverRatio 1])
~~~

![](sw/spl/Help/Image/silverRatio-A.svg)

Silver triangle:

~~~spl svg=B
let a = 67.5.degree;
asaTriangle(a, 1, a)
~~~

![](sw/spl/Help/Image/silverRatio-B.svg)

Silver rectangle in regular octagon:

~~~spl svg=C
let p = 8.regularPolygon([0 0], 1, 1/8.pi);
let c = p.vertexCoordinates;
let r = Polygon(c.atAll([8 1 4 5]));
LineDrawing([p, r])
~~~

![](sw/spl/Help/Image/silverRatio-C.svg)

Silver spiral:

~~~spl svg=D
let b = 1.silverRatio.log / 0.5.pi;
(0 -- 8.pi).discretize(
	200,
	logarithmicSpiral(1, b)
).Line
~~~

![](sw/spl/Help/Image/silverRatio-D.svg)

* * *

See also: e, metallicMean, pellNumbers, pi, plasticRatio, supersilverRatio

Guides: Integer Sequences, Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilverRatio.html),
_OEIS_
[1](https://oeis.org/A014176),
_W_
[1](https://en.wikipedia.org/wiki/Silver_ratio)

Categories: Math, Constant
