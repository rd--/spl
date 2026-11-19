# resample

- _resample(x, n)_

Resample the sequence _x_ to have _n_ places.

Subsample a `List`:

```
>>> [1L .. 5L].resample(9L)
[1/1 3/2 2/1 5/2 3/1 7/2 4/1 9/2 5/1]

>>> [1.0 .. 5.0].resample(9L)
[1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0]

>>> [1L .. 3L].resample(4L)
[1 5/3 7/3 3]

>>> [1.0 .. 4.0].resample(6L)
[1.0 1.6 2.2 2.8 3.4 4.0]
```

Downsample a `List`:

```
>>> [1L .. 5L].resample(3L)
[1/1 3/1 5/1]

>>> [1.0 .. 9.0].resample(5L)
[1.0 3.0 5.0 7.0 9.0]
```

Upsample a two-column matrix:

```
>>> [0 0; 1 1].resample(3)
[0 0; 0.5 0.5; 1 1]
```

Downsample a sine function from 512 to 64 places:

~~~spl svg=A
(0.0 -- 2.pi)
.subdivide(512)
.sin
.resample(64)
.linePlot
~~~

![](Help/Image/resample-A.svg)

At `ColourGradient`,
resamples the gradient to have the specified number of equally spaced positions:

~~~spl svg=B
system
.colourGradients['Mathematica']['CMYKColors']
.ColourGradient
.resample(48)
~~~

![](Help/Image/resample-B.svg)

Subsample a `TimeSeries`:

~~~spl svg=C
TimeSeries([4 1 3 2 5], [1 .. 5])
.resample([1, 1.5 .. 5])
.discretePlot
~~~

![](Help/Image/resample-C.svg)

* * *

See also: ColourGradient, atBlend, blend, downsample, interpolation, linearInterpolation, listInterpolation, upsample

Guides: Interpolation Functions, Time Series Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html)

Categories: Rearranging
