# asPoint

- _asPoint(aSequence | aDictionary)_

Constructs a `Point` of two and three dimensions given an appropriate dictionary.

At `Record`:

```
>>> (x: 1, y: 2).asPoint
Point([1 2])

>>> (x: 1, y: 2, z: 3).asPoint
Point([1 2 3])
```

At `Tuple`:

```
>>> (0, 0, 0).asPoint
Point([0 0 0])
```

At `List`:

```
>>> [0 0 0].asPoint
Point([0 0 0])
```

* * *

See also: asComplex, Point

Categories: Converting
