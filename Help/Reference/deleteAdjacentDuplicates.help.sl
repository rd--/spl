# deleteAdjacentDuplicates

- _deleteAdjacentDuplicates(aSequence, aBlock:/2)_
- _deleteAdjacentDuplicates(α)_ ⟹ _deleteAdjacentDuplicates(α, =)_

Answer a sequence that deletes all duplicates in runs of identical elements in _aSequence_.

At integer sequence:

```
>>> [3 2 2 2 3 3 1].deleteAdjacentDuplicates
[3 2 3 1]
```

At sequence with integers, reals and fractions:

```
>>> [
>>> 	3,
>>> 	2.0, 2, 2.0000,
>>> 	3 / 2, 1.5,
>>> 	1
>>> ].deleteAdjacentDuplicates
[3 2 1.5 1]
```

Delete elements unless they are larger than the preceding ones:

```
>>> [
>>> 	1 3 5 4 3 4 1 9 9 7 8
>>> ].deleteAdjacentDuplicates(>)
[1 3 5 4 9 9 8]
```

Delete sublists that have the same total:

```
>>> [
>>> 	1 2;
>>> 	0 3;
>>> 	1 1;
>>> 	2 0;
>>> 	2 1
>>> ].deleteAdjacentDuplicates { :i :j |
>>> 	i.sum = j.sum
>>> }
[1 2; 1 1 ; 2 1]
```

* * *

See also: deleteDuplicates, split, union

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteAdjacentDuplicates.html)
