# ordering

- _ordering(aSequence)_

Answer the positions in _aSequence_ at which each successive element of _sort(aSequence)_ appears.

Find the ordering that sorts a list:

```
>>> ['c' 'a' 'b'].ordering
[2 3 1]
```

Apply the ordering:

```
>>> ['c' 'a' 'b'].atAll([2 3 1])
['a' 'b' 'c']
```

Find the positions of the 4 smallest elements in a list:

```
>>> [2 6 1 9 1 2 3].ordering.take(4)
[5 3 6 1]
```

Find the position of the largest element:

```
>>> [2 6 1 9 1 2 3].ordering.last
4
```

Find positions of elements from the 4^(th) smallest to the largest:

```
>>> [2 6 1 9 1 2 3].ordering.drop(3)
[1 7 2 4]
```

Find positions of elements in list sorted by _>_:

```
[2 6 1 9 1 2 3].ordering(>)
[4 2 7 1 6 3 5]
```

Find a permutation that sorts a list:

```
>>> [2 6 1 9 1 2 3].ordering
[5 3 6 1 7 2 4]
```

Apply the permutation:

```
>>> let l = [2 6 1 9 1 2 3];
>>> let p = l.ordering;
>>> l.atAll(p)
[1 1 2 2 3 6 9]
```

Find the inverse of a permutation:

```
>>> let p = [4 5 1 2 3];
>>> let i = p.ordering;
>>> let l = ['b' 'c' 'a' 'd' 'e'];
>>> (l.atAll(p), l.atAll(p).atAll(i))
(['d' 'e' 'b' 'c' 'a'], ['b' 'c' 'a' 'd' 'e'])
```

* * *

See also: max, min, sort, sortBy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Order.html)
