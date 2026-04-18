# burnsideCurve

- _burnsideCurve(x, y)_

Implement the implicit equation for the burnside curve.

Evaluate symbolically:

```
>> burnsideCurve(`x`, `y`)
(- (^ y 2) (* x (- (^ x 4) 1)))
```

Plot the burnside curve at _z=0_:

~~~spl svg=A
let i = (-1.5 -- 1.5).subdivide(25);
burnsideCurve:/2.contourPlot(i, i, [0])
~~~

![](Help/Image/burnsideCurve-A.svg)

* * *

See also: bicuspidCurve, stirrupCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BurnsideCurve.html)
