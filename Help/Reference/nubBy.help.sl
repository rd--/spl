# nubBy

- _nubBy(aCollection, aBlock:/2)_

Answer a copy of _aCollection_ that removes any duplicates, according to _aBlock_.
If _aCollection_ is a sequence the copy will preserve the order of elements.

Compare only last items in sub-lists:

```
>>> [1 2; 2 3; 3 3].nubBy { :p :q |
>>> 	p.last = q.last
>>> }
[1 2; 2 3]
```

Nub by `=`:

```
>>> [1 2; 2 3; 3 3].nubBy(=)
[1 2; 2 3; 3 3]
```

Using `==` is special-cased to call `nubIdentical`, which stores seen items in a `Set`.
This will signal an error if the list contains non-immediate values:

```
>>> ['x' 'y' 'z' 'y' 'x'].nubBy(==)
['x' 'y' 'z']
```

* * *

See also: nub, nubIdentical

Categories: Copying
