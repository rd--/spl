# scaleNegative

- _scaleNegative(n, m)_

If _n_ is negative, answer _n×m_, else _n_.

Scale negative part of input,
as a waveshaping function:

```
SinOsc(500, 0)
.scaleNegative(
	Line(1, -1, 7)
) / 7
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :x |
	x.scaleNegative(0.85)
}
~~~

![](Help/Image/scaleNegative-A.svg)

* * *

See also: isNegative, scalePositive, times

Guides: Arithmetic Functions
