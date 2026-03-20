# countIntegers

- _countIntegers(c, [m n])_

Count the occurences of the integers from _m_ to _n_ in the collection _c_ and answer a list of _n-m+1_ places indicating the count for each integer.

Count occurences of one through five:

```
>>> [1 3 5 1 3].countIntegers([1 5])
[2 0 2 0 1]
```

Count occurences of zero through seven:

```
>>> [1 3 5 1 3].countIntegers([0 7])
[0 2 0 2 0 1 0 0]
```

Equivalent to, but more efficent than:

```
>>> let c = [1 3 5 1 3];
>>> 1:5.collect { :n |
>>> 	c.occurrencesOf(n)
>>> }
[2 0 2 0 1]
```

* * *

See also: count, occurrencesOf

Guides: Collection Functions, Integer Functions
