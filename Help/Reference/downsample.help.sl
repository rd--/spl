# downsample

- _downsample([x₁ x₂ …], n)_

Answer a downsampled copy of the sequence _x_ by sampling every _n_-th element.

Downsample a `List` by a factor of two:

```
>>> [1 .. 9].downsample(2)
[1 3 5 7 9]

>>> [1 .. 10].downsample(2)
[1 3 5 7 9]
```

Downsample a `List` by a factor of three:

```
>>> [1 .. 10].downsample(3)
[1 4 7 10]
```

A random walk of three-hundred places:

~~~spl svg=A
Sfc32(289714)
.randomReal([-1 1], [300])
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/downsample-A.svg)

Downsample to one-hundred places:

~~~spl svg=B
Sfc32(289714)
.randomReal([-3 3], 300)
.accumulate
.downsample(3)
.linePlot
~~~

![](sw/spl/Help/Image/downsample-B.svg)

Downsample a randomly generated star convex polygon:

~~~spl svg=C
let r = Sfc32(738941);
let p = r.randomStarConvexPolygon(
	23, 0.5, 1
);
[p, p.downsample(4)].LineDrawing
~~~

![](sw/spl/Help/Image/downsample-C.svg)

* * *

See also: downsampleSteinarsson, resample, upsample

Guides: Interpolation Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Downsample.html),
_W_
[1](https://en.wikipedia.org/wiki/Downsampling_(signal_processing))

Categories: Rearranging
