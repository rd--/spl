# Slice

- _Slice(aSequence, startIndex, size)_

A `Slice` is a `Type` holding a view into a segment of _aSequence_,
starting at _startIndex_,
and continuning for _size_ places.

`Slice` does not copy the elements from _aSequence_ into separate storage.

`sliceFromTo` constructs a `Slice` from a `Sequence`:

```
>>> let list = [1 .. 9] ++ [9 .. 1];
>>> let slice = list.sliceFromTo(7, 13);
>>> (
>>> 	list.size, list.indices, list.sum,
>>> 	slice.size, slice.indices, slice.asList,
>>> 	slice.first, slice.last, slice.sum
>>> )
(
	18, 1:18, 90,
	7, 1:7, [7 8 9 9 8 7 6],
	7, 6, 54
)
```

A `Slice` is a sequence, hence one can take a `Slice` of a `Slice`:

```
>>> let p = 111:999;
>>> let q = p.sliceFromTo(333, 777);
>>> let r = q.sliceFromTo(222, 444);
>>> (
>>> 	[p.first, p.last, p.size],
>>> 	[q.first, q.last, q.size],
>>> 	[r.first, r.last, r.size]
>>> )
(
	[111 999 889],
	[443 887 445],
	[664 886 223]
)

>>> 111:999.copyFromTo(333, 777)
443:887

>>> 443:887.copyFromTo(222, 444)
664:886
```

* * *

See also: copyFromTo, Sequence, sliceFromTo

Categories: Collection, Type
