# downsample

- _downsample([x₁ x₂ …], n, ϕ=0)_

Answer a downsampled copy of the sequence _x_ by sampling every _n_-th element,
with a starting offset of ϕ.

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

Phase offset of two:

```
>>> [1 .. 9].downsample(3, 2)
[3 6 9]

>>> [1 .. 11].downsample(3, 2)
[3 6 9]
```

Decrease the sample rate of a matrix by a factor of three:

```
>>> [4 3].iota.downsample(3)
[
	 1  2  3;
	10 11 12
]
```

A random walk of three-hundred places:

~~~spl svg=A
Sfc32(289714)
.randomReal([-1 1], [300])
.accumulate
.linePlot
~~~

![](Help/Image/downsample-A.svg)

Downsample to one-hundred places:

~~~spl svg=B
Sfc32(289714)
.randomReal([-3 3], 300)
.accumulate
.downsample(3)
.linePlot
~~~

![](Help/Image/downsample-B.svg)

Downsample a randomly generated star convex polygon:

~~~spl svg=C
let r = Sfc32(738941);
let p = r.randomStarConvexPolygon(
	23, 0.5, 1
);
[p, p.downsample(4)].LineDrawing
~~~

![](Help/Image/downsample-C.svg)

* * *

See also: downsampleSteinarsson, resample, upsample

Guides: Interpolation Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Downsample.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/downsample.html),
_W_
[1](https://en.wikipedia.org/wiki/Downsampling_(signal_processing))

Categories: Rearranging
