# nubCumulatively

- _nubCumulatively(c, =)_

Remove from each sublist at the list _c_ any items that appear in any earlier sublist,
according to the comparison block _=_.
As with `nub`, retained items will remain in sequence.

```
>>> [1; 1 2; 1 2 3; 1 2 3 4]
>>> .nubCumulatively(==)
[1; 2; 3; 4]

>>> [1 2 3; 3 4 5; 5 6 7]
>>> .nubCumulatively(==)
[1 2 3; 4 5; 6 7]
```

Relation to `nub`:

```
>>> [1 1 2 1 2 3 1 2 3 4].nub(==)
[1 2 3 4]

>>> [1 2 3 3 4 5 5 6 7].nub(==)
[1 2 3 4 5 6 7]
```

* * *

See also: IdentitySet, add, includesBy, nub, nubSieve, select

Guides: List Functions

Categories: Copying
