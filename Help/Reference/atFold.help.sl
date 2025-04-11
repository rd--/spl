# atFold

- _atFold(aSequence, index)_

Answer the element at _index_ in _aSequence_.
If _index_ is out of bounds, let it fold back in on itself.

```
>>> [1 .. 5].atFold(-1)
3

>>> [1 .. 5].atFold(9)
1
```

This form of indexing _reflects_ points at the boundaries:

```
>>> (-1 .. 9).collect { :i |
>>> 	(1 .. 5).atFold(i)
>>> }
[3 2 1 2 3 4 5 4 3 2 1]
```

* * *

See also: at, atBlend, atPin, atWrap

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-foldAt)

Categories: Acccessing
