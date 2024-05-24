# flatten

- _flatten(aCollection)_

Similar to `concatenation` but removes all nesting.

```
>>> [1 [2 [3 [4 [5] 6] 7] 8] 9].flatten
[1 .. 9]

>>> [1 [2 [3 [4 [5 [6 [7 [8 [9]]]]]]]]].flatten
[1 .. 9]

>>> [[[[[[[[[1] 2] 3] 4] 5] 6] 7] 8] 9].flatten
[1 .. 9]
```

Strings are not flattened to sequences of characters:

```
>>> [1 [2 [3 ['45' 6] '78']] 9].flatten
[1 2 3 '45' 6 '78' 9]
```

Join lists and individual elements:

```
>>> [1:5, -1, 1:5, 1:5, -1].flatten
[1 2 3 4 5 -1 1 2 3 4 5 1 2 3 4 5 -1]

>>> [[1], 2, [[3, 4], 5], [[[]]], [[[6]]], 7, 8, []].flatten
[1 .. 8]
```

Unravel a matrix:

```
>>> (1:3 ^.t 1:4).flatten
[1 1 1 1 2 4 8 16 3 9 27 81]
```

As an inverse of `clump`:

```
>>> [1 .. 20].clump(4).flatten
[1 .. 20]
```

At `Tree`:

```
>>> [1 [2 [3] 4] 5].asTree.flatten
[1 2 3 4 5]
```

`flatten` is `flattenTo` of `inf`.

* * *

See also: ++, concatenation, deepDo, flattenTo

References:
_Apl_
[1](https://aplwiki.com/wiki/Ravel),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/comma),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Flatten.html)

Categories: Converting
