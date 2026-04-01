# zOrderCurve

- _zOrderCurve(n)_

Answer the line segments representing the first _n_ places of the Z-order curve,
also called the Morton curve or the Lebesgue curve.

First few terms of the Z-order curve:

```
>>> 8.zOrderCurve
[0 0; 1 0; 0 1; 1 1; 2 0; 3 0; 2 1; 3 1]
```

Draw the first few terms of the Z-order curve:

~~~spl svg=A
256.zOrderCurve.collect { :each |
	let [x, y] = each;
	[x, 0 - y]
}.Line
~~~

![](Help/Image/zOrderCurve-A.svg)

_x_-coordinates of the Z-order curve,
OEIS [A059905](https://oeis.org/A059905):

~~~spl svg=B oeis=A059905
85.zOrderCurve
.column(1)
.discretePlot
~~~

![](Help/Image/zOrderCurve-B.svg)

_y_-coordinates of the Z-order curve,
OEIS [A059906](https://oeis.org/A059906):

~~~spl svg=C oeis=A059906
85.zOrderCurve
.column(2)
.discretePlot
~~~

![](Help/Image/zOrderCurve-C.svg)

_x_-coordinates of the ternary Z-order curve,
OEIS [A163325](https://oeis.org/A163325):

~~~spl svg=D oeis=A163325
0:85.collect { :n |
	let d = n.integerDigits(9);
	(d % 3).fromDigits(3)
}.discretePlot
~~~

![](Help/Image/zOrderCurve-D.svg)

_y_-coordinates of the ternary Z-order curve,
OEIS [A163326](https://oeis.org/A163326):

~~~spl svg=E oeis=A163326
0:85.collect { :n |
	let d = n.integerDigits(9);
	(d // 3).fromDigits(3)
}.discretePlot
~~~

![](Help/Image/zOrderCurve-E.svg)

The ternary Z-order curve:

~~~spl svg=F
0:728.collect { :n |
	let d = n.integerDigits(9);
	let x = (d % 3).fromDigits(3);
	let y = (d // 3).fromDigits(3);
	[x, y]
}.Line
~~~

![](Help/Image/zOrderCurve-F.svg)

* * *

See also: deinterleave, fromDigits, integerDigits

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Z-order_curve)

Further Reading: Morton 1966
