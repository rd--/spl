# resample

- _resample(aSequence, anInteger)_

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

* * *

See also: blendAt, downsample, upsample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html)

Categories: Rearranging
