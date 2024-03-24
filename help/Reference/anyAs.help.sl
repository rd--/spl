# anyAs

- _any(aCollection, anInteger, aBlock:/1)_

Answer _anInteger_ elements from _aCollection_ as a new collection constructed using _aBlock_.
It is an error if there are not enough elements.

At `List`:

```
>>> [1 .. 9].anyAs(3, { :k | Set() })
[1 .. 3].asSet
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).anyAs(2, List:/1)
[1 2]
```

* * *

See also: any, anyOne, take

Categories: Accessing
