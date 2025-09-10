# complement

- _complement(c)_
- _complement(c₁, c₂)_

In the unary case,
answer the complement of the collection _c_.

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let b = [0 2 4 5 7 9 11].asBitSet;
>>> (b.asList, b.complement.asList)
([0 2 4 5 7 9 11], [1 3 6 8 10])
```

The complement of a `ResidueSet` is the difference to the complete residue set _Z_:

```
>>> [0 2 4 5 7 9 11]
>>> .asResidueSet(12)
>>> .complement
>>> .asList
[1 3 6 8 10]
```

The `complement` of a `Graph` is a graph with the same vertices and the complement edge set,
c.f. `complementGraph`:

```
>>> 6.cycleGraph
>>> .complement
>>> .edgeList
[
	1 3; 1 4; 1 5;
	2 4; 2 5; 2 6;
	3 5; 3 6;
	4 6
].asEdgeList
```

In the binary case,
answer the items in _c₁_ that are not in _c₂_.

Find elements in the first list that are not in the second list:

```
>>> [1 2 3 4 5].complement([1 3 5])
[2 4]
```

Find divisors of 20 that are not also divisors of 12:

```
>>> 20.divisors.complement(12.divisors)
[5 10 20]
```

Find which triples of digits do not occur in the binary decomposition of 12345:

```
>>> [0 1].tuples(3).complement(
>>> 	12345
>>> 	.integerDigits(2)
>>> 	.partition(3, 1)
>>> )
[0 1 0; 1 0 1]
```

Where supported `complement` is displayed as ∁.

* * *

See also: BitSet, complementGraph, Graph, intersection, union, ResidueSet, select, symmetricDifference, take, uniqueElements

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Complement.html)
[2](https://mathworld.wolfram.com/ComplementSet.html)
[3](https://mathworld.wolfram.com/GraphComplement.html)

Unicode: U+02201 ∁ Complement

Categories: Enumerating, IdentitySet
