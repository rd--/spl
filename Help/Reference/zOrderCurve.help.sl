# zOrderCurve

- _zOrderCurve(n)_

Answer the line segments representing the first _n_ places of the Z-order curve,
also called the Morton curve or the Lebesgue curve.

First few terms:

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

![](sw/spl/Help/Image/zOrderCurve-A.svg)

* * *

See also: deinterleave, fromDigits, integerDigits

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Z-order_curve)
