# any

- _any(aCollection, anInteger)_

Answer _anInteger_ elements from _aCollection_ as a new collection (using _species_).
It is an error if there are not enough elements.

At List:

```
>>> [1 .. 9].any(3)
[1 .. 3]
```

At Record:

```
>>> (x: 1, y: 2, z: 3).any(2)
(x: 1, y: 2)
```

* * *

See also: anyOne, take

Categories: Accessing
