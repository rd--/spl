# anySatisfy

_anySatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock:/1_ with the elements of _aCollection_.
If _aBlock:/1_ answers true for any element return true, otherwise return false.
Only tests elements until one elements answers true.

```
>>> [1 3 5 7 9].anySatisfy(even:/1)
false

>>> [1 2 3 4 5].anySatisfy(even:/1)
true
```

An empty collection always answers false:

```
>>> [].anySatisfy(even:/1)
false
```

* * *

See also: allSatisfy, noneSatisfy

Categories: Testing
