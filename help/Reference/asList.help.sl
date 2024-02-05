# asList

_asList(aCollection)_

Answer a List whose elements are the elements of _aCollection_.

```
>>> let l = [1 .. 5];
>>> l.asList == l
true

>>> 'string'.asList
['s' 't' 'r' 'i' 'n' 'g'].collect(asCharacter:/1)
```

This should not be defined for scalar values, see _asCollection_.

* * *

See also: List, asCollection

Categories: Converting
