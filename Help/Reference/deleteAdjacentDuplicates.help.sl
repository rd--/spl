# deleteAdjacentDuplicates

- _deleteAdjacentDuplicates([x₁ x₂ …], f/2)_

Answer a sequence that deletes all duplicates in runs of identical elements in the sequence _x_,
according to _f_.

At integer sequence:

```
>>> [3 2 2 2 3 3 1]
>>> .deleteAdjacentDuplicates
[3 2 3 1]
```

At sequence with integers, reals and fractions,
note how `=` and `==` compare equivalent `Fraction` and `Float` values:

```
>>> [=, ==].collect { :f/2 |
>>> 	[
>>> 		3.0, 3L,
>>> 		2L, 4.sqrt,
>>> 		3/2, 1.5,
>>> 		1.0, 1/1
>>> 	].deleteAdjacentDuplicates(f/2)
>>> }
[
	3.0 2L 3/2 1.0;
	3.0 3L 2L 2.0 3/2 1.5 1.0 1/1
]
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

See also: deleteDuplicates, nub, split, union, unique

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteAdjacentDuplicates.html)
