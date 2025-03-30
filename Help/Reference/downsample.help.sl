# downsample

- _downsample(aSequence, anInteger)_

Answer a downsampled copy of _aSequence_ by sampling every _anInteger_-th element.

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

* * *

See also: downsampleSteinarsson, resample, upsample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Downsample.html)

Categories: Rearranging
