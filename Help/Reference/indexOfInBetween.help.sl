# indexOfInBetween

- _indexOfInBetween(aSequence, aNumber)_

Answer the, possibly fractional, index such that `atBlend` of _aSequence_,
which must be ascending,
would answer _aNumber_,
assuming it is in range.

```
>>> [2 3 5 6].indexOfInBetween(5)
3

>>> [2 3 5 6].indexOfInBetween(5.2)
3.2

>>> [2 3 5 6].atBlend(3.2)
5.2

>>> [2 3 5 6].listInterpolation(
>>> 	linearInterpolation:/3
>>> ).value(3.2)
5.2
```

Equal elements are allowed:

```
>>> [3 5 5 5 5 7].indexOfInBetween(4.6)
1.8

>>> [3 5 5 5 5 7].indexOfInBetween(5.4)
5.2
```

Out of range items answer the first and last indices:

```
>>> 2:8.collect { :each |
>>> 	[3 5 7].indexOfInBetween(each)
>>> }
[1 1 1.5 2 2.5 3 3]

>>> [1 1 1.5 2 2.5 3 3].collect { :each |
>>> 	[3 5 7].atBlend(each)
>>> }
[3 3 4 5 6 7 7]
```

* * *

See also: atBlend, indexOf, linearInterpolation, listInterpolation

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-indexInBetween)

Categories: Accessing
