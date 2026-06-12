# keyUnion

- _keyUnion([d₁ d₂ …], m)_

Answer a list of dictionaries in which each has the union of the keys of all dictionaries in _d_,
padding by inserting values of _m_ of the missing key as necessary,
where _m_ is either a unary block or a dictionary.

Make a list of records with the same keys:

```
>>> [(a: 1, b: 2), (b: 3)].keyUnion
[(a: 1, b: 2), (a: Missing('KeyAbsent', 'a'), b: 3)]
```

Use a function to provide missing values:

```
>>> let m = nil.constant;
>>> [(a: 1, b: 2), (b: 3)].keyUnion(m)
[(a: 1, b: 2), (a: nil, b: 3)]

>>> [(a: 1, b: 2), (b: 3)].keyUnion { :key |
>>> 	(a: -1, b: -2).at(key)
>>> }
[(a: 1, b: 2), (a: -1, b: 3)]
```

If _m_ is a dictionary lookup missing key values directly:

```
>>> let m = (a: -1, b: -2);
>>> [(a: 1, b: 2), (b: 3)].keyUnion(m)
[(a: 1, b: 2), (a: -1, b: 3)]
```

* * *

See also: keyIntersection, keys, union

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeyUnion.html)
