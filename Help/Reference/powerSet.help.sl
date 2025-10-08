# powerSet

- _powerSet([x₁ x₂ …])_

Answer a `List` of the elements of the power set of a collection.

All subsets of the `List` _{1,2,3}_, including the empty set:

```
>>> [1 2 3].powerSet
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

The power set of a set of _n_ elements has _2ⁿ_ elements:

```
>>> [1 2 3 4].powerSet.size
2 ^ 4
```

The number of subsets of each cardinality is given by `binomial`:

```
>>> let l = 0:4.collect { :each |
>>> 	4.binomial(each)
>>> };
>>> (l, l.sum)
([1 4 6 4 1], 16)
```

At `List`, different occurrences of the same element are treated as distinct:

```
>>> [1 1].powerSet
[; 1; 1; 1 1]
```

At `IdentitySet`:

```
>>> [1 2 3].asIdentitySet.powerSet
[
	;
	1; 2;
	1 2;
	3;
	1 3; 2 3;
	1 2 3
].collect(asIdentitySet:/1)
```

The power set of the integers _1 .. n_ give the indices for all subsequences, disjoint and continuous, of a sequence of size _n_:

```
>>> let l = ['x' 'y' 'z'];
>>> (1 .. l.size).powerSet.collect {:each |
>>> 	(l @* each).stringJoin
>>> }
['' 'x' 'y' 'xy' 'z' 'xz' 'yz' 'xyz']
```

* * *

See also: powerSetDo, subsets, tuples

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerSet.html)
[2](https://reference.wolfram.com/language/ref/Subsets.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/subset.html#sage.combinat.subset.powerset),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-powerset),
_W_
[1](https://en.wikipedia.org/wiki/Power_set)

Categories: Set Operations
