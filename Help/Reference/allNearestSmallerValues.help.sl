# allNearestSmallerValues

- _allNearestSmallerValues(l)_

Answer two lists that,
for each position in the list of numbers _l_,
tell the index and the value of the last item that is less than the present item.
Indicates that there is no such item,
which is always the case for the first item,
by `nil`.

Of the binary van der Corput sequence:

```
>>> [0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15]
>>> .allNearestSmallerValues
[
	nil 1 1 3 1 5 5 7 1 9 9 11 9 13 13 15;
	nil 0 0 4 0 2 2 6 0 1 1  5 1  3  3  7
]
```

Of the reverse of the binary van der Corput sequence:

```
>>> [15 7 11 3 13 5 9 1 14 6 10 2 12 4 8 0]
>>> .allNearestSmallerValues
[
	nil nil 2 nil 4 4 6 nil 8 8 10 8 12 12 14 nil;
	nil nil 7 nil 3 3 5 nil 1 1  6 1  2  2  4 nil
]
```

* * *

See also: <

Guides: List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/All_nearest_smaller_values)
