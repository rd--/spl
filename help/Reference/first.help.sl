# first

- _first(aSequence)_
- _first(aSequence, anInteger)_

The unary form answers the first element of _aSequence_.

```
>>> 1:6.first
1

>>> 6:1.first
6
```

The binary form answers the first _anInteger_ elements of _aSequence_:

```
>>> 1:99.first(23)
1:23

>>> [3 .. 9].first(4)
[3 4 5 6]
```

* * *

See also: firstIndex, fourth, last, middle, second, third

References:
_Smalltalk_
5.7.8.17

Categories: Accessing
