# atPin

- _atPin(s, i)_

Answer the element of the seqence _s_ at the index _i_ if possible.
Answer the first or last element if the index is out of bounds.

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
