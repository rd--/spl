# valueSort

- _valueSort(x)_

Answer an association list of the items in the dictionary-like object _x_ sorted by value.

At `Record:

```
>>> (a: 3, c: 1, b: 2)
>>> .valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]
```

At `Map`:

```
>>> ['a': 3, 'c': 1, 'b': 2]
>>> .valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]
```

At `Multiset`:

```
>>> 'abcaba'.characters
>>> .Multiset
>>> .valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]
```

At an `Association` `List`:

```
>>> ['a' -> 3, 'b' -> 2, 'c' -> 1].valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]
```

* * *

See also: Dictionary, keys, keySort, sort

Guides: Dictionary Functions
