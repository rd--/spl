# Iterator -- collection trait

A Stream represents the ability to maintain a position reference into a collection of objects.

The basic Stream protocol consists of:

- _next_: consume and answer the next element from the stream if it has one, else nil

Finite streams are collections and implement _do_ and _size_.

* * *

See also: PositionableStream, ReadStream, WriteStream
