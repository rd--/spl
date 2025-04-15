# isIterator

- _isIterator(anObject)_

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
