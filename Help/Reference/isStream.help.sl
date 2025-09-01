# isStream

- _isStream(x)_

Answer `true` if the object _x_ implements the `Stream` trait.

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

Guides: Stream Functions
