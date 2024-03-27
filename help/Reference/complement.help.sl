# complement

- _complement(aBitSet | aResidueSet)_

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = l.asBitSet;
>>> (b.asList, b.complement.asList)
(l, [1 3 6 8 10])
```

At `ResidueSet`:

```
>>> [0 2 4 5 7 9 11].asResidueSet(12).complement.asList
[1 3 6 8 10]
```

* * *

See also: BitSet, intersection, union, ResidueSet, symmetricDifference
