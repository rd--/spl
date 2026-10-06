# findStringStartingAt

- _findStringStartingAt(s, x, n)_

Find the index of next occurence of the string _x_ in the string _s_,
starting at index _n_.
If no such match is found, answer 0.

```
>>> 'abracadabra'.findStringStartingAt('ra', 1)
3

>>> 'abracadabra'.findStringStartingAt('ra', 4)
10
```

If the string is at the start index answer the start index:

```
>>> 'abracadabra'.findStringStartingAt('ra', 3)
3
```

If no such match is found, answer 0:

```
>>> 'abracadabra'.findStringStartingAt('ax', 3)
0
```

* * *

See also: findPreviousOccurrenceOfStringStartingAt, indexOfSubstringStartingAt
