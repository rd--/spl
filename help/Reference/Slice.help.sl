# Slice

A `Slice` is a `Type` holding a view into a subsequence of elements of another sequence.
A slice stores a base collection and the first and last indices of the view.
It does not copy the elements from the collection into separate storage.

Indices of a slice can be used interchangeably with indices of the base collection.
An element of a slice is located under the same index in the slice and in the base collection,
as long as neither the collection nor the slice has been mutated since the slice was created.

`slice` constructs a `Slice` from a `Sequence`:

```
>>> let list = [1 .. 9] ++ [9 .. 1];
>>> let slice = list.slice(7, 13);
>>> (
>>> 	list.size, list.indices, list.sum,
>>> 	slice.size, slice.indices, slice.asList,
>>> 	slice.first, slice.last, slice.sum
>>> )
(
	18, 1:18, 90,
	7, 7:13, [7 8 9 9 8 7 6],
	7, 6, 54
)
```

_Warning_:
Although `Slice` implements `Collection`, `Indexable` and `Sequence`,
many of the trait methods are not applicable,
either because they assume indices run from `one` to `size`,
or because they require `species` for copying.
These issues are considered errors and should be corrected.

* * *

See also: Sequence, slice

Categories: Collection, Type
