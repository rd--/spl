# ordering

- _ordering(l, f:/2=<)_

Answer the positions in the sequence _l_ at which each successive element of _sort(l)_ appears.

Find the ordering that sorts a list:

```
>>> ['c' 'a' 'b'].ordering(<)
[2 3 1]

>>> [3 -4 1 4 22 17 -2 2 13 -11]
>>> .ordering
[10 2 7 3 8 1 4 9 6 5]

>>> [-20 -24 0 4 24 36 -12 -12 56 -14]
>>> .ordering
[2 1 10 8 7 3 4 5 6 9]
```

Apply the ordering:

```
>>> ['c' 'a' 'b'].atAll([2 3 1])
['a' 'b' 'c']

>>> let u = [3 -4 1 4 22 17 -2 2 13 -11];
>>> u.atAll(u.ordering)
[-11 -4 -2 1 2 3 4 13 17 22]

>>> let u = [-20 -24 0 4 24 36 -12 -12 56 -14];
>>> u.atAll(u.ordering)
[-24 -20 -14 -12 -12 0 4 24 36 56]
```

There is more than one ordering of a list with equal items:

```
>>> [0 2 3 2].ordering
[1 2 4 3]
```

Find the positions of the 4 smallest elements in a list:

```
>>> [2 6 1 9 1 2 3].ordering(<).take(4)
[3 5 1 6]
```

Find the position of the largest element:

```
>>> [2 6 1 9 1 2 3].ordering(<).last
4
```

Find positions of elements from the fourth smallest to the largest:

```
>>> [2 6 1 9 1 2 3].ordering(<).drop(3)
[6 7 2 4]
```

Find positions of elements in list sorted by `>`:

```
>>> [2 6 1 9 1 2 3].ordering(>)
[4 2 7 1 6 3 5]
```

Find a permutation that sorts a list:

```
>>> [2 6 1 9 1 2 3].ordering(<)
[3 5 1 6 7 2 4]
```

Apply the permutation:

```
>>> let l = [2 6 1 9 1 2 3];
>>> let p = l.ordering(<);
>>> l.atAll(p)
[1 1 2 2 3 6 9]
```

Find the inverse of a permutation:

```
>>> let p = [4 5 1 2 3];
>>> let i = p.ordering(<);
>>> let l = ['b' 'c' 'a' 'd' 'e'];
>>> (l.atAll(p), l.atAll(p).atAll(i))
(['d' 'e' 'b' 'c' 'a'], ['b' 'c' 'a' 'd' 'e'])
```

At `List` of `Character`:

```
>>> ', ZAMBIA.'.asList.ordering(<)
[2 1 9 4 8 6 7 5 3]
```

* * *

See also: max, min, sort, sortBy

Guides: Permutation Functions, Sort Functions, Statistics Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Grade),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Ordering.html),
_NumPy_
[1](https://numpy.org/doc/stable/reference/generated/numpy.argsort.html)

Categories: Sorting
