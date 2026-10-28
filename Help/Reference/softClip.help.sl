# softClip

- _softClip(x)_

Nonlinear distortion.
Distortion with a perfectly linear region from -0.5 to +0.5.

The soft clip function:

~~~spl svg=A
(-1 -- 1).functionPlot(softClip/1)
~~~

![](Help/Image/softClip-A.svg)

Linearly increase amplitude introducing distortion:

```
(sinOsc(500, 0) * xLine(0.1, 10, 10))
.softClip * 0.1
```

With named temporary variables:

```
let e = xLine(0.1, 10, 10);
let o = sinOsc(500, 0);
(o * e).softClip * 0.1
```

Evaluate symbolically:

```
>> softClip(`x`)
(if (<= (abs x) 0.5)
  x
  (/ (- (abs x) 0.25) x)
)
```

* * *

See also: distort

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.softclip)

Categories: Ugen
