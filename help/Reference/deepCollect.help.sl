# deepCollect

_deepCollect(aCollection, aBlock:/1)_

Collect over _aCollection_,
descending into elements that are of the same type as _aCollection_,
else applying _aBlock_.

The answer has the same structure as _aCollection_.

At `List`:

```
>>> ['a' ['b' ['c' ['d']]]].deepCollect(asUppercase:/1)
['A' ['B' ['C' ['D']]]]
```

At `Tuple`:

```
>>> ('a', ('b', ('c', 'd'))).deepCollect(asUppercase:/1)
('A', ('B', ('C', 'D')))
```

At `Record`:

```
>>> (x: 'a', y: (x: 'b', y: (x: 'c'))).deepCollect(asUppercase:/1)
(x: 'A', y: (x: 'B', y: (x: 'C')))
```

* * *

See also: collect, deepDo, deepIndices, do

Categories: Enumerating
