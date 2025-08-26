# keySort

- _keySort(d)_

Answer an association list of the items in the dictionary _d_ sorted by key.

Sort the elements in a `Record` by key:

```
>>> (a: 3, c: 1, b: 2).keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `Map`:

```
>>> ['c' -> 1, 'b' -> 2, 'a' -> 3]
>>> .asMap
>>> .keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `Bag`:

```
>>> 'abcaba'.characters.asBag.keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

At `List`:

```
>>> ['c' -> 1, 'b' -> 2, 'a' -> 3].keySort
['a' -> 3, 'b' -> 2, 'c' -> 1]
```

Use `valueSort` to sort by value:

```
>>> (a: 3, c: 1, b: 2).valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]

>>> 'abcaba'.characters.asBag.valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]

>>> ['a' -> 3, 'b' -> 2, 'c' -> 1].valueSort
['c' -> 1, 'b' -> 2, 'a' -> 3]
```

* * *

See also: Dictionary, keys, sort, valueSort

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeySort.html)
