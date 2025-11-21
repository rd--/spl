# countingSort

- _countingSort([x₁ x₂ …], f:/1, k)_

Implement the counting sort algorithm.
Answer a sorted list of the values at _x_ given the key block _f_,
which must answer a positive integer for each _x_,
and the key limit _k_.

Sort by `key` specifying maximum key:

```
>>> [3 -> 'z', 2 -> 'y', 1 -> 'z']
>>> .countingSort(key:/1, 3)
[1 -> 'z', 2 -> 'y', 3 -> 'z']
```

Sort by `value` without specifying maximum key:

```
>>> ['z' -> 3, 'y' -> 2, 'z' -> 1]
>>> .countingSort(value:/1)
['z' -> 1, 'y' -> 2, 'z' -> 3]
```

Sort by `identity`:

```
>>> [3 2 1 6 5 4 3 2 1]
>>> .countingSort
[1 1 2 2 3 3 4 5 6]
```

Sort by `codePoint`:

```
>>> 'ascii'.characters
>>> .countingSort(codePoint:/1)
['a' 'c' 'i' 'i' 's']
```

* * *

See also: sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Counting_sort)
