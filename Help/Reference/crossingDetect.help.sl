# crossingDetect

- _crossingDetect(data, delta=0)_

Answer a `SparseArray` in which `1` corresponds to zero crossings in _data_,
according to _delta_.

Zero crossings of a list:

```
>>> [4 0 1 -2 1 -2 -3 -1 3]
>>> .crossingDetect.normal
[0 0 0 1 1 1 0 0 1]
```

A zero-crossing occurs when the last non-zero `sign` is opposite to the current `sign`:

```
>>> [0 -1 0 0 1 0]
>>> .crossingDetect.normal
[0 0 0 0 1 0]
```

Visiting zero is not a zero crossing:

```
>>> [0 1 0 1 0 1 0 -1]
>>> .crossingDetect.normal
[0 0 0 0 0 0 0 1]
```

* * *

See also: boole, contourDetect, count, threshold, unitize

Guides: Feature Detection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CrossingDetect.html),
_Mathworks_
[1](https://mathworks.com/help/dsp/ref/dsp.zerocrossingdetector-system-object.html)
