# resample

- _resample(aSequence | aColourGradient, anInteger)_

Resample _aSequence_ to have _anInteger_ places.

Subsample a list:

```
>>> 1:5.resample(9)
[1 3/2 2 5/2 3 7/2 4 9/2 5]

>>> 1:3.resample(4)
[1 5/3 7/3 3]

>>> 1:4.resample(6)
[1 1.6 2.2 2.8 3.4 4]
```

Downsample an array:

```
>>> 1:5.resample(3)
[1 3 5]

>>> 1:9.resample(5)
[1 3 5 7 9]
```

Upsample a two-column matrix:

```
>>> [0 0; 1 1].resample(3)
[0 0; 0.5 0.5; 1 1]
```

Downsample a sine function from 512 to 64 places:

~~~spl svg=A
(0 -- 2.pi)
.subdivide(512)
.sin
.resample(64)
.linePlot
~~~

![](sw/spl/Help/Image/resample-A.svg)

At `ColourGradient`, resamples the gradient to have the specified number of equally spaced positions.

~~~spl svg=B
system
.colourGradients[
	'Mathematica',
	'CMYKColors'
]
.asColourGradient
.resample(48)
~~~

![](sw/spl/Help/Image/resample-B.svg)

* * *

See also: atBlend, blend, ColourGradient, downsample, linearInterpolation, listInterpolation, upsample

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html)

Categories: Rearranging
