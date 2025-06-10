# SoftClip

- _SoftClip(x)_

Nonlinear distortion.
Distortion with a perfectly linear region from -0.5 to +0.5.

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(SoftClip:/1)
~~~

![](sw/spl/Help/Image/SoftClip-A.svg)

Linearly increase amplitude introducing distortion:

```
(SinOsc(500, 0) * XLine(0.1, 10, 10))
.SoftClip * 0.1
```

With named temporary variables:

```
let e = XLine(0.1, 10, 10);
let o = SinOsc(500, 0);
(o * e).SoftClip * 0.1
```

* * *

See also: Distort

References:
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.softclip)

Categories: Ugen
