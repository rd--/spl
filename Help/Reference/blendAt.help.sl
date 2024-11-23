# blendAt

- _blendAt(aSequence, aNumber)_

Answer a linearly interpolated value between the two closest indices.

```
>>> [2 3 5 6].blendAt(3.2)
5.2

>>> [2 3 5 6].indexOfInBetween(5.2)
3.2
```

Out of range indices answer end points:

```
>>> [2 3 5 6].blendAt(-1)
2

>>> [2 3 5 6].blendAt(7)
6
```

Resample sequence:

~~~
(1 -- 4).discretize(16).collect { :each |
	[1 2 4 7].blendAt(each)
}.discretePlot
~~~

* * *

See also: at, indexOfInBetween, resample

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-blendAt)

Categories: Accessing
