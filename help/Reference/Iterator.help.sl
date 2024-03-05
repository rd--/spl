# Iterator

`Iterator` is a `Collection` `Trait`.

An iterator represents the ability to maintain a position reference into a collection of objects.

To implement `Iterator` a type must implement `next`.

```
>>> let i = 1:9.asIterator;
>>> (i.next, i.next, i.next)
(1, 2, 3)
```

`Iterator` implements: `any`, `do`, `nextInto`, `nextMatchFor`, `nextSatisfy`, `nextUntil`, `nextWhile`, `upToEnd`.

* * *

See also: asIterator, next, Stream
