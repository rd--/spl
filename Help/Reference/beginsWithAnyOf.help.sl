# beginsWithAnyOf

- _beginsWithAnyOf(aSequence, aCollection)_

Answer if _aSequence_ begins with any element of _aCollection_.

```
>>> [1 .. 5].beginsWithAnyOf(
>>> 	[4 5; 3 4; 2 3]
>>> )
false

>>> [1 .. 5].beginsWithAnyOf(
>>> 	[0 1; 1 2; 2 3]
>>> )
true
```

* * *

See also: beginsWith, endsWithAnyOf

Categories: Testing
