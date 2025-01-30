# last

- _last(aSequence)_
- _last(aSequence, anInteger)_
- _last(aSequence, anInteger, anObject)_

The unary form answers the last element of _aSequence_.

```
>>> 1:6.last
6

>>> (6 .. 1).last
1
```

The binary form answers the last _anInteger_ elements of _aSequence_:

```
>>> 1:99.last(23)
77:99

>>> [3 .. 9].last(4)
[6 7 8 9]
```

The ternary form will fill missing places with the specified value.
Convert a list to a fixed size:

```
>>> [3 1 4 1 5 9 6 2 3 5].last(6, 0)
[5 9 6 2 3 5]

>>> [2 3 5].last(6, 0)
[0 0 0 2 3 5]
```

* * *

See also: drop, first, lastIndex, middle, take

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot#dyadic)
_Smalltalk_
5.7.8.25

Categories: Accessing
