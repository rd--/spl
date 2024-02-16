# nubBy

_nubBy(aCollection, aBlock:/2)_

Answer a copy of _aCollection_ that removes any duplicates, according to _aBlock_.
If _aCollection_ is a sequence the copy will preserve the order of elements.

```
>>> [1 2; 2 3; 3 3].nubBy { :p :q | p.last = q.last }
[1 2; 2 3]

>>> [1 2; 2 3; 3 3].nubBy(=)
[1 2; 2 3; 3 3]
```

* * *

See also: nub

Categories: Copying
