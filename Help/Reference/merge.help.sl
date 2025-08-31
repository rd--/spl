# merge

- _merge([d₁ d₂ …], f:/1=⊣)_

Merges the dictionaries _d_, using the block _f_ to combine values with the same key.

Merge two records, using `sum` to combine elements with the same key:

```
>>> [(a: 1, b: 2), (a: 5, b: 10)]
>>> .merge(sum:/1)
(a: 6, b: 12)
```

Combine values corresponding to identical keys into lists:

```
>>> [(a: 1, b: 2), (b: 4, c: 5)]
>>> .merge(identity:/1)
(a: [1], b: [2 4], c: [5])
```

Merge records with no common keys:

```
>>> [(a: 1, b: 2), (c: 3, d: 4)].merge
(a: [1], b: [2], c: [3], d: [4])
```

Merge records requiring that there be no common keys:

```
>>> [(a: 1, b: 2), (c: 3, d: 4)]
>>> .merge { :x |
>>> 	{ x.size = 1 }.assert;
>>> 	x[1]
>>> }
(a: 1, b: 2, c: 3, d: 4)
```

Merge retaining answer from leftmost entry:

```
>>> [(a: 1, b: 2), (b: 3, c: 4)]
>>> .merge(first:/1)
(a: 1, b: 2, c: 4)
```

Merge retaining answer from rightmost entry:

```
>>> [(a: 1, b: 2), (b: 3, c: 4)]
>>> .merge(last:/1)
(a: 1, b: 3, c: 4)
```

Merge record with an empty record:

```
>>> [(a: 1, b: 2), ()].merge
(a: [1], b: [2])

>>> [(), (a: 1, b: 2)].merge
(a: [1], b: [2])
```

* * *

See also: counts, gather, groupBy, keyIntersection, keyUnion, transpose

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Merge.html)
