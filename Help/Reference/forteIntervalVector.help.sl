# forteIntervalVector

- _forteIntervalVector(p)_

Answer the Forte interval vector of the pitch-class set _p_.
The vector has six places and counts the occurences of the interval classes one through six.

All-interval tetrachords:

```
>>> [0 1 4 6].forteIntervalVector
[1 1 1 1 1 1]

>>> [0 1 3 7].forteIntervalVector
[1 1 1 1 1 1]
```

All-trichord hexachords:

```
>>> [0 1 2 4 7 8].forteIntervalVector
[3 2 2 3 3 2]

>>> [0 1 2 5 7 8].forteIntervalVector
[3 2 2 2 4 2]
```

Diatonic hexachord and diatonic scale:

```
>>> [0 2 4 5 7 9].forteIntervalVector
[1 4 3 2 5 0]

>>> [0 2 4 5 7 9 11].forteIntervalVector
[2 5 4 3 6 1]
```

* * *

See also: forteNumber, mandereauIntervalVector

Guides: Atonal Theory Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Interval_vector)

Further Reading: Forte 1973
