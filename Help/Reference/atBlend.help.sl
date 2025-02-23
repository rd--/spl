# atBlend

- _atBlend(aSequence, aNumber)_

Answer a linearly interpolated value between the two closest indices.

```
>>> [2 3 5 6].atBlend(3.2)
5.2

>>> [2 3 5 6].indexOfInBetween(5.2)
3.2
```

Out of range indices answer end points:

```
>>> [2 3 5 6].atBlend(-1)
2

>>> [2 3 5 6].atBlend(7)
6
```

At matrix:

```
>>> [0 0 0; 0 0.5 1.5].atBlend(1.75)
[0 0.375 0.125]
```

Resample sequence:

~~~svg=A
(1 -- 4).discretize(16).collect { :each |
	[1 2 4 7].atBlend(each)
}.discretePlot
~~~

![](sw/spl/Help/Image/atBlend-A.svg)

* * *

See also: at, atAllBlend, atFold, atPin, atWrap, blend, indexOfInBetween, linearInterpolation, listInterpolation, resample

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-atBlend)

Categories: Accessing
