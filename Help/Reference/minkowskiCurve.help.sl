# minkowskiCurve

- _minkowskiCurve(n)_

+SmallFloat{
	minkowskiCurve { :self |
		let z = 0;
		let a = [z];
		let m = [0 1 0 -1 -1 0 1 0];
		0.toDo(self - 2) { :n |
			z := z + (1.i ^ n.integerDigits(8).sum { :d | m[d + 1] });
			a.add(z)
		};
		a.realImaginary
	}
}

Answer the first _n_ terms of the Minkowski curve.

_x_-coordinates of the Minkowski curve,
OEIS [A332246](https://oeis.org/A332246):

~~~spl svg=A oeis=A332246
85.minkowskiCurve
.column(1)
.discretePlot
~~~

![](Help/Image/minkowskiCurve-A.svg)

_y_-coordinates of the Minkowski curve,
OEIS [A332247](https://oeis.org/A332247):

~~~spl svg=B oeis=A332247
85.minkowskiCurve
.column(2)
.discretePlot
~~~

![](Help/Image/minkowskiCurve-B.svg)

The Minkowski curve,
OEIS [A332247](https://oeis.org/A332247):

~~~spl svg=C
250.minkowskiCurve.Line
~~~

![](Help/Image/minkowskiCurve-C.svg)

* * *

See also: hilbertCurve, sierpinskiCurve

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Minkowski_Sausage)
