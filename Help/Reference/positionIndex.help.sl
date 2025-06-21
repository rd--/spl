# positionIndex

- _positionIndex([x₁ x₂ …])_

Answer a `Map` between unique (according to `==`) items in _x_ and the positions at which they occur.

Find positions of items in a `List`:

```
>>> 'abcaca'.contents.positionIndex
[
	'a' -> [1 4 6],
	'b' -> [2],
	'c' -> [3 5]
].asMap
```

Find positions of elements in an association:

```
>>> (a: 1, b: 2, c: 3, d: 4, e: 3, f: 1)
>>> .positionIndex
[
	(1 -> ['a', 'f']),
	(2 -> ['b']),
	(3 -> ['c', 'e']),
	(4 -> ['d'])
].asMap
```

* * *

See also: deleteDuplicates, tally

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PositionIndex.html)
