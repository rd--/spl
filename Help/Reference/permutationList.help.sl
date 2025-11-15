# permutationList

- _permutationList(p, n)_

Answer a permutation list representation of the permutation _p_,
which may be given in cyclic form.

In the binary case,
the answer will have _n_ places.

In the unary case,
the size will is given by `permutationMax`.

Convert permutation cycles to a permutation list:

```
>>> [1 2 5 3 7; 4; 6].permutationList
[2 5 7 4 3 6 1]

>>> [1 6 7; 2 3; 4; 5].permutationList
[6 3 2 4 5 7 1]

>>> [1 5; 2 9 3; 4; 6; 7; 8].permutationList
[5 9 2 4 1 6 7 8 3]

>>> [1 5 6; 2 4; 3].permutationList
[5 4 3 2 6 1]
```

Length specification:

```
>>> [1 6 7; 2 3].permutationList(9)
[6 3 2 4 5 7 1 8 9]

>>> [].permutationList(10)
[1 2 3 4 5 6 7 8 9 10]
```

`permutationList` and `permutationCycles` are inverse functions:

```
>>> let l = [6 3 5 4 2 7 8 1];
>>> let c = l.permutationCycles;
>>> (c, c.permutationList)
(
	[1 6 7 8; 2 3 5],
	[6 3 5 4 2 7 8 1]
)
```

At identity permutation:

```
>>> [].permutationList(5)
[1 2 3 4 5]
```

At a permutation list, answer the identity:

```
>>> [4 3 2 1].permutationList
[4 3 2 1]
```

* * *

See also: isPermutationList, permutationCycles, permutationMatrix

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationList.html)

Categories: Permutations
