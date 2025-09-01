# isIterator

- _isIterator(x)_

Answer `true` if the object _x_ implements the `Iterator` trait.

At `Sfc32`, an instance of `RandomNumberGenerator`:

```
>>> let r = Sfc32();
>>> (r.isIterator, r.isStream)
(true, true)
```

At `CollectionStream`:

```
>>> let i = [].asIterator;
>>> (i.typeOf, i.isIterator)
('CollectionStream', true)
```

* * *

See also: Iterator, Stream

Guides: Stream Functions
