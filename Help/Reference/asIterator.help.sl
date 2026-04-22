# asIterator

- _asIterator(c)_

At `List` and `Range`,
answer a `CollectionStream` on the collection _c_.

```
>>> let i = 1:9.asIterator;
>>> (i.next, i.next, i.next)
(1, 2, 3)
```

Alias for `asStream`.

* * *

See also: asStream, CollectionStream, do, Iterator, Iterable, next, Stream

Guides: Stream Functions

Categories: Converting
