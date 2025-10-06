# bowCurve

- _bowCurve(x, y)_

Implement the implicit equation for the bow curve.

Evaluate symbolically:

```
>> bowCurve(`x`, `y`)
(+ (- (^ x 4) (* (^ x 2) y)) (^ y 3))
```

Plot the bow curve at _z=0_:

~~~spl svg=A
let i = (-0.5 -- 0.5).subdivide(50);
bowCurve:/2.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/bowCurve-A.svg)

* * *

See also: bicuspidCurve, stirrupCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Bow.html)
