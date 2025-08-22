# ellipticCurveOverFiniteField

- _ellipticCurveOverFiniteField(a, b, q)_

Answer the elliptic curve _y²=x³+ax+b_ over the finite field _Fq_.

```
>>> ellipticCurveOverFiniteField(1, 1, 7)
[0 1; 0 6; 2 2; 2 5]

>>> ellipticCurveOverFiniteField(3, 0, 7)
[0 0; 1 2; 1 5; 2 0; 3 1; 3 6; 5 0]
```

Plot for _a=-1,b=0,q=61_:

~~~spl svg=A
ellipticCurveOverFiniteField(-1, 0, 61)
.scatterPlot
~~~

![](sw/spl/Help/Image/ellipticCurveOverFiniteField-A.svg)

Plot for _a=-1,b=0,q=71_:

~~~spl svg=B
ellipticCurveOverFiniteField(-1, 0, 71)
.scatterPlot
~~~

![](sw/spl/Help/Image/ellipticCurveOverFiniteField-B.svg)

Plot for _a=-1,b=0,q=89_:

~~~spl svg=C
ellipticCurveOverFiniteField(-1, 0, 89)
.scatterPlot
~~~

![](sw/spl/Help/Image/ellipticCurveOverFiniteField-C.svg)

Plot for _a=-7,b=10,q=487_:

~~~spl svg=D
ellipticCurveOverFiniteField(-7, 10, 487)
.scatterPlot
~~~

![](sw/spl/Help/Image/ellipticCurveOverFiniteField-D.svg)

* * *

See also: ellipticCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EllipticCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_curve)
