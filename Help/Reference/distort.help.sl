# distort

- _distort(x)_

Nonlinear distortion.
Implements _x/(1+|x|)_.

```
>>> distort(0.5)
1/3

>>> 0.5 / (1 + 0.5.abs)
1/3
```

Evaluate symbolically:

```
>> distort(`x`)
(/ x (+ 1 (abs x)))
```

Distortion increases with amplitude:

```
(
	SinOsc(500, 0) * XLine(0.1, 10, 10)
).distort * 0.1
```

Plot over _(-1,1)_:

~~~spl svg=A
(-1 -- 1).functionPlot(distort/1)
~~~

![](Help/Image/distort-A.svg)

* * *

See also: softClip, tanh

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/distort.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.distort)

Categories: Ugen
