# permutationFixedPoints

- _permutationFixedPoints(p)_

Answer a `List` of the fixed points of the permutation _p_.

A permutation with one cycle and two fixed points:

```
>>> let p = Permutation[1 3 2 4];
>>> (p.cycles, p.fixedPoints)
([[2, 3]], [1, 4])
```

A permutation with two cycles and one fixed point:

```
>>> let p = Permutation[1 4 2 3 6 5];
>>> (p.cycles, p.fixedPoints)
([2 4 3; 5 6], [1])
```

A permutation with two cycles and two fixed points:

```
>>> let p = Permutation[2 4 1 3 5 8 7 6];
>>> (p.cycles, p.fixedPoints)
([1 2 4 3; 6 8], [5 7])
```

The identity permutation has only fixed points:

```
>>> let p = Permutation[1 2 3 4 5];
>>> (p.cycles, p.fixedPoints)
([], [1 2 3 4 5])
```

The fixed points are the `complement` of the support:

```
>>> [1 3 2 4].permutationFixedPoints
[1 4]

>>> [1 3 2 4].permutationSupport
[2 3]
```

The fixed points of the identity permutation:

```
>>> [1 2 3 4].permutationFixedPoints
[1 2 3 4]
```

* * *

See also: cycles, Permutation, support

Guides: Permutation Functions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.fixed_points),
_W_
[1](https://en.wikipedia.org/wiki/Cycles_and_fixed_points)
