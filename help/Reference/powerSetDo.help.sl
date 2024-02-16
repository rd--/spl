# powerSetDo

- _powerSetDo(aCollection, aBlock:/1)_

Apply _aBlock_ to each element of the power set of _aCollection_.
The List object received at each step is the same object,
it must be copied if it is to be retained.

All subsets of _[1 2 3]_:

```
>>> let l = [];
>>> [1 2 3].powerSetDo { :each | l.add(each.copy) };
>>> l
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

* * *

See also: powerSet, subsets, tuples
