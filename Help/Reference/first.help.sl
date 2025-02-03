# first

- _first(aSequence)_
- _first(aSequence, anInteger)_
- _first(aSequence, anInteger, anObject)_

The unary form answers the first element of _aSequence_.

```
>>> 1:6.first
1

>>> (6 .. 1).first
6
```

The binary form answers the first _anInteger_ elements of _aSequence_:

```
>>> 1:99.first(23)
1:23

>>> [3 .. 9].first(4)
[3 4 5 6]
```

The first element in a sorted list is the same as finding the minimum element:

```
>>> [6 7 1 2 4 5].sort.first
1

>>> [6 7 1 2 4 5].min
1
```

The ternary form will fill missing places with the specified value.
Convert a list to a fixed size:

```
>>> [3 1 4 1 5 9 6 2 3 5].first(6, 0)
[3 1 4 1 5 9]

>>> [3 1 4].first(6, 0)
[3 1 4 0 0 0]
```

* * *

See also: fourth, last, middle, second, third

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylfdot#dyadic),
_Smalltalk_
5.7.8.17

Categories: Accessing
