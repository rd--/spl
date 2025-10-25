# stirrupCurve

- _stirrupCurve(x, y)_

Implement the implicit equation for the stirrup curve.

Evaluate symbolically:

```
>> stirrupCurve(`x`, `y`)
(-
 (^ (- (^ x 2) 1) 2)
 (* (^ y 2) (* (* (- y 1) (- y 2)) (+ y 5))))
```

Plot the stirrup curve at _z=0_::

~~~spl svg=A
let i = (-5 -- 5).subdivide(50);
stirrupCurve:/2
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/stirrupCurve-A.svg)

* * *

See also: bicuspidCurve, bowCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StirrupCurve.html)
