# ordering

- _ordering(aSequence, aBlock:/2)_

Answer the positions in _aSequence_ at which each successive element of _sort(aSequence)_ appears.

Find the ordering that sorts a list:

```
>>> ['c' 'a' 'b'].ordering(<=)
[2 3 1]
```

Apply the ordering:

```
>>> ['c' 'a' 'b'].atAll([2 3 1])
['a' 'b' 'c']
```

Find the positions of the 4 smallest elements in a list:

```
>>> [2 6 1 9 1 2 3].ordering(<=).take(4)
[5 3 6 1]
```

Find the position of the largest element:

```
>>> [2 6 1 9 1 2 3].ordering(<=).last
4
```

Find positions of elements from the fourth smallest to the largest:

```
>>> [2 6 1 9 1 2 3].ordering(<=).drop(3)
[1 7 2 4]
```

Find positions of elements in list sorted by `>`:

```
>>> [2 6 1 9 1 2 3].ordering(>)
[4 2 7 1 6 3 5]
```

Find a permutation that sorts a list:

```
>>> [2 6 1 9 1 2 3].ordering(<=)
[5 3 6 1 7 2 4]
```

Apply the permutation:

```
>>> let l = [2 6 1 9 1 2 3];
>>> let p = l.ordering(<=);
>>> l.atAll(p)
[1 1 2 2 3 6 9]
```

Find the inverse of a permutation:

```
>>> let p = [4 5 1 2 3];
>>> let i = p.ordering(<=);
>>> let l = ['b' 'c' 'a' 'd' 'e'];
>>> (l.atAll(p), l.atAll(p).atAll(i))
(['d' 'e' 'b' 'c' 'a'], ['b' 'c' 'a' 'd' 'e'])
```

At `List` of `Character`:

```
>>> ', ZAMBIA.'.asList.ordering(<=)
[2 1 9 8 4 6 7 5 3]
```

* * *

See also: max, min, sort, sortBy

Guides: Permutation Functions, Sort Functions, Statistics Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Grade),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Order.html),
_NumPy_
[1](https://numpy.org/doc/stable/reference/generated/numpy.argsort.html)

Categories: Sorting
