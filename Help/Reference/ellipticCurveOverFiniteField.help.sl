# ellipticCurveOverFiniteField

- _ellipticCurveOverFiniteField(a, b, q)_

Answer the elliptic curve _y²=x³+ax+b_ over the finite field _Fq_.

```
>>> ellipticCurveOverFiniteField(1L, 1L, 7L)
[0L 1L; 0L 6L; 2L 2L; 2L 5L]

>>> ellipticCurveOverFiniteField(3L, 0L, 7L)
[0 0; 1 2; 1 5; 2 0; 3 1; 3 6; 5 0]
```

Plot for _a=-1,b=0,q=61_:

~~~spl svg=A
ellipticCurveOverFiniteField(-1L, 0L, 61L)
.scatterPlot
~~~

![](Help/Image/ellipticCurveOverFiniteField-A.svg)

Plot for _a=-1,b=0,q=71_:

~~~spl svg=B
ellipticCurveOverFiniteField(-1L, 0L, 71L)
.scatterPlot
~~~

![](Help/Image/ellipticCurveOverFiniteField-B.svg)

Plot for _a=-1,b=0,q=89_:

~~~spl svg=C
ellipticCurveOverFiniteField(-1L, 0L, 89L)
.scatterPlot
~~~

![](Help/Image/ellipticCurveOverFiniteField-C.svg)

Plot for _a=-7,b=10,q=487_:

~~~spl svg=D
ellipticCurveOverFiniteField(-7L, 10L, 487L)
.scatterPlot
~~~

![](Help/Image/ellipticCurveOverFiniteField-D.svg)

* * *

See also: ellipticCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EllipticCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_curve)
