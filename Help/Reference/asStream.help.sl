# asStream

- _asStream(c)_

At `List` and `Range`, answer a `CollectionStream` on the collection _c_.

At finite `Range`:

```
>>> let i = 1:9.asStream;
>>> (i.next, i.next, i.next)
(1, 2, 3)
```

At `infinite `Range`:

```
>>> let i = 1:Infinity:2.asStream;
>>> (i.next, i.skip(10_000), i.next)
(1, 10_001, 20_003)
```

Alias for both `asIterator` and `Stream`.

* * *

See also: asIterator, asWriteStream, CollectionStream, Iterator, next, Stream

Guides: Stream Functions

Categories: Converting
