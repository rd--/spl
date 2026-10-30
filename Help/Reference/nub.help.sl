# nub

- _nub([x₁ x₂ …], ==)_

Answer a copy of the collection _x_ that removes any duplicates, according `=`.
If _x_ is a `Sequence` the copy will preserve the order of elements.

```
>>> [1 2 2 3 3 3].nub(==)
[1 2 3]

>>> [1 3 5 3 5 9 5 2 3 5 7 3 5 7 3]
>>> .nub(==)
[1 3 5 9 2 7]

>>> [1 7 8 4 3 4 1 9 9 2].nub(==)
[1 7 8 4 3 9 2]
```

Random integers:

```
>>> Sfc32(38014)
>>> .randomInteger([1 9], [99])
>>> .nub(==)
[9 4 8 3 2 1 6 7 5]
```

Remove rows from a table:

```
>>> [1 0 1; 1 1 0; 1 0 1; 0 1 0; 1 1 0]
>>> .nub(=)
[1 0 1; 1 1 0; 0 1 0]
```

At `Record` deletes assocations if a value occurs earlier in the record:

```
>>> (x: 1, y: 1, z: 1).nub(==)
(x: 1)

>>> (a: 1, b: 2, c: 1, d: 3, e: 2)
>>> .nub(==)
(a: 1, b: 2, d: 3)
```

At `String`:

```
>>> 'abracadabra'.nub
'abrcd'
```

Take the two smallest numbers in a list:

```
>>> [1.e ^ 1.pi, 7.pi, 1.pi ^ 1.e, 23]
>>> .nub(==)
>>> .sort!
>>> .take(2)
[7.pi, 1.pi ^ 1.e]
```

Nub of `=`:

```
>>> [1 2; 2 3; 3 3].nub(=)
[1 2; 2 3; 3 3]
```

To compare using `~` see `deleteDuplicates`:

```
>>> [1 2 3 1.0001 1.9999 9.sqrt]
>>> .deleteDuplicates(~)
[1 2 3]
```

Compare only last items in sub-lists use `deleteDuplicates`:

```
>>> [1 2; 2 3; 3 3]
>>> .deleteDuplicates { :p :q |
>>> 	p.last = q.last
>>> }
[1 2; 2 3]
```

Using `==` will signal an error if the list contains non-immediate values:

```
>>> ['x' 'y' 'z' 'y' 'x'].nub(==)
['x' 'y' 'z']

>>> [1/2 1/3 1/5 1/3 1/2].nub(=)
[1/2 1/3 1/5]
```

* * *

See also: Set, =, ==, copyWithoutIdenticalElements, deleteDuplicates, nubSieve

Guides: Collection Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Unique),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:nub),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/tildedot)
[2](https://www.jsoftware.com/help/dictionary/d221.htm),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteDuplicates.html)

Categories: Copying
