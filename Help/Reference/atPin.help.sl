# atPin

- _atPin(aSequence, index)_

Answer the element of _aSeqence_ at _index_ if possible.
Answer the first or last element if _index_ is out of bounds.

```
>>> [1 .. 5].atPin(-1)
1

>>> [1 .. 5].atPin(9)
5

>>> (-1 .. 9).collect { :i |
>>> 	1:5.atPin(i)
>>> }
[1 1 1 2 3 4 5 5 5 5 5]
```

* * *

See also: at, atAllPin, atFold, atWrap, clip

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-clipAt)

Categories: Accessing
