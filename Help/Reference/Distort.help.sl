# Distort

- _Distort(x)_

Nonlinear distortion. Implements _x/(1+|x|)_.

Plot over _(-1,1)_:

~~~spl svg=A
(-1 -- 1).functionPlot { :x |
	x / (1 + x.abs)
}
~~~

![](sw/spl/Help/Image/Distort-A.svg)

Distortion increases with amplitude:

```
(
	SinOsc(500, 0) * XLine(0.1, 10, 10)
).Distort * 0.1
```

* * *

See also: SoftClip, Tanh

References:
_Csound_
[1](https://csound.com/docs/manual/distort.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.distort)

Categories: Ugen
