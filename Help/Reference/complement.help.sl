# complement

- _complement(anObject)_

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = l.asBitSet;
>>> (b.asList, b.complement.asList)
(l, [1 3 6 8 10])
```

The complement of a `ResidueSet` is the difference to the complete residue set _Z_:

```
>>> let r = [0 2 4 5 7 9 11].asResidueSet(12);
>>> r.complement.asList
[1 3 6 8 10]
```

The `complement` of a `Graph` is a graph with the same vertices and the complement edge set,
c.f. `complementGraph`:

```
>>> 6.cycleGraph.complement.edgeList
[
	1 3; 1 4; 1 5;
	2 4; 2 5; 2 6;
	3 5; 3 6;
	4 6
]
```

* * *

See also: BitSet, intersection, union, ResidueSet, symmetricDifference

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Complement.html)
[2](https://mathworld.wolfram.com/ComplementSet.html)
[3](https://mathworld.wolfram.com/GraphComplement.html)

Categories: Enumerating, Set
