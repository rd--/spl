# nub

_nub(aCollection)_

Answer a copy of _aCollection_ that removes any duplicates, according to =.
If _aCollection_ is a sequence the copy will preserve the order of elements.

```
>>> [1 2 2 3 3 3].nub
[1 2 3]

>>> [1 3 5 3 5 9 5 2 3 5 7 3 5 7 3].nub
[1 3 5 9 2 7]

>>> [1 7 8 4 3 4 1 9 9 2].nub
[1 7 8 4 3 9 2]
```

Remove rows (or colums) from a table:

```
>>> [1 0 1; 1 1 0; 1 0 1; 0 1 0; 1 1 0].nub
[1 0 1; 1 1 0; 0 1 0]
```

At Record deletes assocations if a value occurs earlier in the record:

```
>>> (x: 1, y: 1, z: 1).nub
(x: 1)

>>> (a: 1, b: 2, c: 1, d: 3, e: 2).nub
(a: 1, b: 2, d: 3)
```

At String:

```
>>> 'abracadabra'.nub
'abrcd'
```

* * *

See also: =, ==, asSet, copyWithoutIdenticalElements, deleteDuplicates, Set

References:
_Apl_
[1](https://aplwiki.com/wiki/Unique),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:nub),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDuplicates.html),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/tildedot)

Categories: Copying
