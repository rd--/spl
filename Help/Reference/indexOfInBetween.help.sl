# indexOfInBetween

- _indexOfInBetween(aSequence, aNumber)_

Answer the index such that `atBlend` of _aSequence_,
which must be ascending,
would answer _aNumber_.

```
>>> [2 3 5 6].indexOfInBetween(5.2)
3.2

>>> [2 3 5 6].atBlend(3.2)
5.2

>>> [2 3 5 6].listInterpolation(
>>> 	linearInterpolation:/3
>>> ).value(3.2)
5.2
```

* * *

See also: atBlend, indexOf, linearInterpolation, listInterpolation

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-indexInBetween)

Categories: Accessing
