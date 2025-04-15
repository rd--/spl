# isStream

- _isStream(anObject)_

At `Sfc32`, an instance of `RandomNumberGenerator`:

```
>>> Sfc32().isStream
true
```

At `CollectionStream`:

```
>>> let i = [].asStream;
>>> (i.typeOf, i.isStream)
('CollectionStream', true)
```

* * *

See also: Iterator, Stream
