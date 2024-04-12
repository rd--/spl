# permutationList

- _permutationList(aSequence)_
- _permutationList(aSequence, anInteger)_

In the binary case,
answer a permutation list representation of the permutation given in cyclic form at _aSequence_ which is of length _anInteger_.

In the unary case,
derive length from maximum element in cyclic form.

Convert permutation cycles to a permutation list:

```
>>> [3 2; 1 6 7].permutationList
[6 3 2 4 5 7 1]

>>> [1 5; 2 9 3].permutationList
[5 9 2 4 1 6 7 8 3]

>>> [1 5 6; 2 4].permutationList
[5 4 3 2 6 1]
```

Length specification:

```
>>> [3 2; 1 6 7].permutationList(9)
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
	[1 6 7 8; 2 3 5; 4],
	[6 3 5 4 2 7 8 1]
)
```

At identity permutation:

```
>>> [].permutationList(5)
[1 2 3 4 5]
```

* * *

See also: isPermutationList, permutationCycles, permutationMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationList.html)
