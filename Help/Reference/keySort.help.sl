# keySort

- _keySort(x)_

Answer an association list of the items in the dictionary-like object _x_ sorted by key.

Sort the elements in a `Record` by key:

```
>>> (a: 3, c: 1, b: 2).keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `Map`:

```
>>> ['c': 1, 'b': 2, 'a': 3]
>>> .keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `Multiset`:

```
>>> 'abcaba'.characters.asMultiset.keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `List`:

```
>>> ['c' -> 1, 'b' -> 2, 'a' -> 3].keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

Use `valueSort` to sort by value.

* * *

See also: Dictionary, keys, sort, valueSort

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeySort.html)
