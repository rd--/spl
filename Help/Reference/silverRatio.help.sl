# silverRatio

- _silverRatio(n)_

Answer _n_ × the silver ratio, _√2+1_, usually written as δs or λ or σ.

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

The `reciprocal` of δs is its `fractionalPart`:

```
>>> 1.silverRatio.reciprocal
1.silverRatio.fractionalPart
```

As a continued fraction:

```
>>> 1.silverRatio
>>> .continuedFraction(14)
[2 2 2 2 2 2 2 2 2 2 2 2 2 2]

>>> 1.silverRatio.square
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
>>> 	0.5 * (x.square + 1) / (x - 1)
>>> }.fixedPoint(2.5, ~)
1.silverRatio
```

A silver triangle has height _δs/2_:

```
>>> let a = 67.5.degree;
>>> let t = asaTriangle(a, 1, a);
>>> let [_, _, h] = t.altitudes;
>>> h * 2
1.silverRatio
```

Draw silver rectangle:

~~~spl svg=A
Rectangle([0, 0], [1.silverRatio 1])
~~~

![](sw/spl/Help/Image/silverRatio-A.svg)

Draw silver triangle:

~~~spl svg=B
let a = 67.5.degree;
asaTriangle(a, 1, a)
~~~

![](sw/spl/Help/Image/silverRatio-B.svg)

Silver rectangle and silver triangle in regular octagon:

~~~spl svg=C
let p = 8.regularPolygon([0 0], 1, 1/8.pi);
let c = p.vertexCoordinates;
let r = Polygon(c.atAll([8 1 4 5]));
let t = Triangle([c[6], c[7], [0 0]]);
LineDrawing([p, r, t])
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

Nested silver rectangles, scaled by _1/δs_:

~~~spl svg=E
let s = 1.silverRatio;
let r = centeredRectangle([0 0], [s 1]);
{ :x |
	x.rotate(1/4.pi).scale(1 / s)
}.nestList(r, 4).LineDrawing
~~~

![](sw/spl/Help/Image/silverRatio-E.svg)

Nested silver triangles:

~~~spl svg=F
let s = 1.silverRatio;
let a = 67.5.degree;
let m = 2 * a.cos;
let t = asaTriangle(a, 2, a);
let c = [2, s + 1, 2] / (s + 5);
{ :x |
	let r = x.fromBarycentricCoordinates(c);
	x.rotate(112.5.degree, r).scale(m)
}.nestList(t, 6).LineDrawing
~~~

![](sw/spl/Help/Image/silverRatio-F.svg)

* * *

See also: e, metallicMean, pellNumbers, pi, plasticRatio, supersilverRatio

Guides: Integer Sequence Functions, Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilverRatio.html),
_OEIS_
[1](https://oeis.org/A014176),
_W_
[1](https://en.wikipedia.org/wiki/Silver_ratio)

Categories: Math, Constant
