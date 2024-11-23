# endsWithAnyOf

- _endsWithAnyOf(aSequence, aCollection)_

Answer if _aSequence_ ends with any element of _aCollection_.

```
>>> [1 .. 5].endsWithAnyOf([4 5; 3 4; 2 3])
true

>>> [1 .. 5].endsWithAnyOf([0 1; 1 2; 2 3])
false
```

* * *

See also: endsWith, beginsWithAnyOf

Categories: Testing
