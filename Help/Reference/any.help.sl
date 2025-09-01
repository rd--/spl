# any

- _any(c, n)_

Answer _n_ elements from the collection _c_ as a new collection (using `species`).
It is an `error` if there are not enough elements.

At `List`:

```
>>> [1 .. 9].any(3)
[1 .. 3]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).any(2)
(x: 1, y: 2)
```

* * *

See also: anyAs, anyOne, take

Guides: Stream Functions

Categories: Accessing
