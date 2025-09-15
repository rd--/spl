# nubBy

- _nubBy(c, f:/2)_

Answer a copy of the collection _c_ that removes any duplicates, according to _f_.
If _c_ is a sequence the copy will preserve the order of elements.

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

Nub by `~`:

```
>>> [1 2 3 1.0001 1.9999 9.sqrt].nubBy(~)
[1 2 3]
```

Using `==` is special-cased to call `nubIdentical`, which stores seen items in a `IdentitySet`.
This will signal an error if the list contains non-immediate values:

```
>>> ['x' 'y' 'z' 'y' 'x'].nubBy(==)
['x' 'y' 'z']
```

* * *

See also: nub, nubIdentical

Guides: List Functions

Categories: Copying
