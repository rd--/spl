# Stream

`Stream` is a `Trait` that represents the ability to maintain a position reference into a collection of objects.

> We use the phrase _streaming over a collection_ to mean accessing the
> elements of a collection in such a way that it is possible to
> enumerate or store each element, one at a time, possibly
> intermingling these operations. By creating several Streams over the
> same collection, it is possible to maintain multiple position
> references into the same collection. (Blue Book, p. 195)

`Stream` adds `reset` to the `Iterator` protocol.

* * *

See also: Iterator, PositionableStream, reset, WriteStream
