# allSatisfy

- _allSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock_ with the elements of _aCollection_.
If _aBlock_ returns false for any element return false, otherwise return true.
Only tests elements until one answers false.

```
>>> [1 3 5 7 9].allSatisfy(odd:/1)
true

>>> [1 2 3 4 5].allSatisfy(odd:/1)
false
```

The empty list always answers true:

```
>>> [].allSatisfy(odd:/1)
true
```

* * *

See also: anySatisfy, noneSatisfy

Categories: Testing
