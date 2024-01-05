# Stream -- collection trait

A Stream represents the ability to maintain a position reference into a collection of objects.

> We use the phrase _streaming over a collection_ to mean accessing the
> elements of a collection in such a way that it is possible to
> enumerate or store each element, one at a time, possibly
> intermingling these operations. By creating several Streams over the
> same collection, it is possible to maintain multiple position
> references into the same collection. (Blue Book, p. 195)

The basic Stream protocol consists of:

- _atEnd_: answer if the stream can acccess any more elements
- _next_: consume and answer the next element from the stream if it has one, else nil

Finite streams are collections and implement _do_ and _size_.

* * *

See also: PositionableStream, ReadStream, WriteStream
