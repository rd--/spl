# deepCollect

- _deepCollect(c, f:/1)_

Collect over the collection _c_,
descending into elements that are of the same type as _c_,
else applying the block _f_.
The answer has the same structure as _c_.

At `List`:

```
>>> ['a', ['b', ['c', ['d']]]]
>>> .deepCollect(asUpperCase:/1)
['A', ['B', ['C', ['D']]]]
```

At `Record`:

```
>>> (x: 'a', y: (x: 'b', y: (x: 'c')))
>>> .deepCollect(asUpperCase:/1)
(x: 'A', y: (x: 'B', y: (x: 'C')))
```

* * *

See also: collect, deepDo, deepIndices, do

Guides: Dictionary Functions, List Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lcapco)

Categories: Enumerating
