# BlockStream

- _BlockStream(nextBlock:/0, resetBlock:/0)_

`BlockStream` is a `Type` that implements the `Iterator` and `Stream` traits.

`BlockStream` provides a simple model for many kinds of streams,
with the restriction that the stream cannot be copied.

`BlockStream` implements `collect`, `reject` and `select`,
as well as the adaptTo protocol and the usual math operators.

* * *

See also: CollectionStream, Iterator, Stream

Categories: Stream, Type
