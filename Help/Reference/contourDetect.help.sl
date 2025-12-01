# contourDetect

- _contourDetect(data, delta=0)_

Answer a `SparseArray` in which `1` corresponds to zero values,
as well as positive values that have at least one negative neighbour,
according to _delta_.

Zeroes and zero crossings of a list:

```
>>> [4 0 1 -2 1 -2 -3 -1 3]
>>> .contourDetect.normal
[0 1 1 0 1 0 0 0 1]

>>> [0 -1 0 0 1 0]
>>> .contourDetect.normal
[1 0 1 1 0 1]

>>> [0 1 0 1 0 1 0 -1]
>>> .contourDetect.normal
[1 0 1 0 1 0 1 0]
```

* * *

See also: crossingDetect, threshold

Guides: Feature Detection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContourDetect.html)
