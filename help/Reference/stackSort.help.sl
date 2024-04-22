# stackSort

- _stackSort(aPermutation)_

A stack-sortable permutation is a permutation whose elements may be sorted correctly using a single stack.
They are exactly the permutations that do not contain the permutation pattern _231_.
They are counted by the Catalan numbers.

Stack-sortable permutations:

```
>>> [1 3 2 4].stackSort
[1 .. 4]

>>> [1 3 2 5 4 6].stackSort
[1 .. 6]

>>> [6 3 2 1 4 5 8 7].stackSort
[1 .. 8]

>>> [3 1 2 6 5 4 7 8].stackSort
[1 .. 8]
```

Non-stack-sortable permutations:

```
>>> [3 2 4 1].stackSort
[2 3 1 4]

>>> [3 6 4 5 2 1].stackSort
[3 4 1 2 5 6]

>>> [2 1 5 3 4 9 7 8 6].stackSort
[1 2 3 4 5 7 6 8 9]
```

Of the 120 permutations of _S5_, 42 are stack sortable:

```
>>> let i = [1 .. 5];
>>> i.permutations.count { :each |
>>> 	each.stackSort = i
>>> }
42

>>> 5.catalanNumber
42
```

* * *

See also: catalanNumber, dyckWords, Permutation

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.stack_sort),
_W_
[1](https://en.wikipedia.org/wiki/Stack-sortable_permutation)

Further Reading: Knuth 1968, Rotem 1981
