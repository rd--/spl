# asStream

- _asStream(c)_

At `List` and `Range`, answer a `CollectionStream` on the collection _c_.

```
>>> let i = 1:9.asStream;
>>> (i.next, i.next, i.next)
(1, 2, 3)
```

Alias for both `asIterator` and `Stream`.

* * *

See also: asIterator, asWriteStream, CollectionStream, Iterator, next, Stream

Guides: Stream Functions

Categories: Converting
