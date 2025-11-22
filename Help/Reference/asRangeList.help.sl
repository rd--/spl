# asRangeList

- _asRangeList([x₁ x₂ …])_

Answer a `List` of `Range` values that, when concatenated, is equivalent to the sequence _x_.

At empty `List`:

```
>>> [].asRangeList
[]
```

At one element `List`:

```
>>> [1].asRangeList
[Range(1, 1, 1)]
```

Any two element numerical sequence is a `Range`:

```
>>> [1 2].asRangeList
[Range(1, 2, 1)]

>>> [1 0].asRangeList
[Range(1, 0, -1)]

>>> [1 3].asRangeList
[Range(1, 3, 2)]

>>> [0, 1.pi].asRangeList
[Range(0, 1.pi, 1.pi)]
```

Reconstruct a `List` of `Range` items:

```
>>> let r = [
>>> 	13:18 22:27 31:36
>>> 	40:45 49:57 61:65
>>> ];
>>> r.catenate.asRangeList
r
```

Find complementary ranges:

```
>>> let r = [
>>> 	13:18 22:27 31:36
>>> 	40:45 49:57 61:65
>>> ];
>>> 1:75.differenceAll(r).asRangeList
[
	1:12 19:21 28:30
	37:39 46:48 58:60
	66:75
]

>>> let r1 = [
>>> 	1:12 19:21 28:30
>>> 	37:39 46:48 58:60
>>> 	66:75
>>> ];
>>> let r2 = [
>>> 	13:18 22:27 31:36
>>> 	40:45 49:57 61:65
>>> ];
>>> [r1 r2].flatten.sort.asRange
1:75
```

* * *

See also: asRange, Range

Guides: List Functions

Categories: Converting
