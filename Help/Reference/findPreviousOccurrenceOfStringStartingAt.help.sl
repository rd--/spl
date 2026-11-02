# findPreviousOccurrenceOfStringStartingAt

- _findPreviousOccurrenceOfStringStartingAt(p, q, n)_

Find the previous occurence of the string _q_ in the string _p_ starting at index _n_.
If no such match is found, answer 0.

```
>>> 'abracadabra'
>>> .findPreviousOccurrenceOfStringStartingAt(
>>> 	'ra', 5
>>> )
3

>>> 'abracadabra'
>>> .findPreviousOccurrenceOfStringStartingAt(
>>> 	'ra', 11
>>> )
10
```

If the string is at the start index answer the start index:

```
>>> 'abracadabra'
>>> .findPreviousOccurrenceOfStringStartingAt(
>>> 	'ra', 3
>>> )
3
```

If no such match is found, answer 0:

```
>>> 'abracadabra'
>>> .findPreviousOccurrenceOfStringStartingAt(
>>> 	'ax', 3
>>> )
0
```

* * *

See also: findStringStartingAt

Guides: String Functions
