# mandereauIntervalVector

- _mandereauIntervalVector(p)_

Answer the Mandereau interval vector of the pitch-class set _p_.
The vector has twelve places and counts the occurences of the intervals zero through eleven.

All-interval tetrachords:

```
>>> [0 1 4 6].mandereauIntervalVector
[4 1 1 1 1 1 2 1 1 1 1 1]

>>> [0 1 3 7].mandereauIntervalVector
[4 1 1 1 1 1 2 1 1 1 1 1]
```

All-trichord hexachords:

```
>>> [0 1 2 4 7 8].mandereauIntervalVector
[6 3 2 2 3 3 4 3 3 2 2 3]

>>> [0 1 2 5 7 8].mandereauIntervalVector
[6 3 2 2 2 4 4 4 2 2 2 3]
```

Diatonic hexachord and diatonic scale:

```
>>> [0 2 4 5 7 9]
>>> .mandereauIntervalVector
[6 1 4 3 2 5 0 5 2 3 4 1]

>>> [0 2 4 5 7 9 11]
>>> .mandereauIntervalVector
[7 2 5 4 3 6 2 6 3 4 5 2]
```

The interval vector of a periodic set is periodic:

```
>>> [0 1 3 6 7 9]
>>> .mandereauIntervalVector
[6 2 2 4 2 2 6 2 2 4 2 2]

>>> [0 1 3 6 7 9].forteNumber
'6-30'
```

* * *

See also: forteIntervalVector

Guides: Atonal Theory Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Interval_vector)

Further Reading: Mandereau 2011
