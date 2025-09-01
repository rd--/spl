# BlockStream

- _BlockStream(nextBlock:/0, resetBlock:/0)_

`BlockStream` is a `Type` that implements the `Iterator` and `Stream` traits.

```
>>> let n = 1;
>>> let s = BlockStream {
>>> 	let r = n;
>>> 	n := n + 2;
>>> 	r
>>> } {
>>> 	n := 1
>>> };
>>> (s.next(7), s.reset, s.next(2))
([1 3 5 7 9 11 13], 0, [1 3])
```

`BlockStream` provides a simple model for many kinds of streams,
with the restriction that the stream cannot be copied.

`BlockStream` implements `collect`, `reject` and `select`,
as well as the _adapt-to_ protocol and the usual math operators.

* * *

See also: CollectionStream, Iterator, Stream

Guides: AdaptTo Protocol, Stream Functions

Categories: Stream, Type
