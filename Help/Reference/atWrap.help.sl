# atWrap

- _atWrap(s, i)_

Answer the element at the index _i_ in the sequence _s_.
If the index is out of bounds, let it wrap around from the end to the beginning until it is in bounds.

```
>>> 1:5.atWrap(-1)
4

>>> 1:5.atWrap(9)
4

>>> -1:9.collect { :i |
>>> 	1:5.atWrap(i)
>>> }
[4 5 1 2 3 4 5 1 2 3 4]
```

* * *

See also: at, atAllWrap, atFold, atPin, atPutWrap

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-wrapAt)

Categories: Acccessing
