# permutationInversions

- _permutationInversions(aPermutation)_

Answer a `List` of the inversions of _aPermutation_.
Inversions are the _indices_ of pairs which are out of order.

```
>>> [3 2 4 1 5].permutationInversions
[1 2; 1 4; 2 4; 3 4]
```

Cramer (1750) defines the inversion under the name dérangement to calculate the sign of a permutation.
For the permutation 3 1 2 the dérangements are given as 3 before 1 and 3 before 2:

```
>>> let p = [3 1 2];
>>> let i = p.permutationInversions;
>>> i.collect { :each | p @* each }
[3 1; 3 2]
```

Knuth (1973) writes:

> If _i < j_ and _p[i] > p[j]_ the pair _(p[i], p[j])_ is called an inversion of the permutation,
> for example the permutation 3 1 4 2 has three inversions: (3, 1), (3, 2) and (4, 2).

```
>>> let p = [3 1 4 2];
>>> let i = p.permutationInversions;
>>> i.collect { :each | p @* each }
[3 1; 3 2; 4 2]
```

The number of inversions in a permutation is equal to that of its inverse:

```
>>> let p = [1 3 2; 4 5 6].cycles;
>>> let q = p.inverse;
>>> (
>>> 	p.list.permutationInversions,
>>> 	q.list.permutationInversions
>>> )
(
	[1 2; 1 3; 4 6; 5 6],
	[1 3; 2 3; 4 5; 4 6]
)
```

The element-based inversion set is the place-based inversion set of the inverse permutation,
with the elements of the pairs exchanged:

```
>>> [3 1 4 2].inversePermutation.inversions.collect(reverse:/1)
[3 1; 3 2; 4 2]
```

A permutation graph is a graph whose vertices represent the elements of a permutation,
and whose edges represent pairs of elements that are reversed by the permutation:

```
>>> let g = [4 3 5 1 2].permutationGraph;
>>> (g.edgeList, g.adjacencyMatrix)
(
	[4 3; 4 1; 3 1; 5 1; 4 2; 3 2; 5 2],
	[
		0 0 1 1 1;
		0 0 1 1 1;
		1 1 0 1 0;
		1 1 1 0 0;
		1 1 0 0 0
	]
)
```

* * *

See also: inversionVector, leftInversionCount, Permutation, rightInversionCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationInversion.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.inversions)
