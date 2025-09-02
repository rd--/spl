# atPath

- _atPath(c, i)_

The indices _i_ describe a path of accesses into the collection _i_, taken in sequence.

A one element path at a `Record`:

```
>>> (x: (y: (z: 1))).atPath(['x'])
(y: (z: 1))
```

A two element path at a `Record`:

```
>>> (x: (y: (z: 1))).atPath(['x' 'y'])
(z: 1)
```

A three element path at a `Record`:

```
>>> (x: (y: (z: 1))).atPath(['x' 'y' 'z'])
1
```

A four element path at a `Record`:

```
>>> (w: (x: (y: (z: 1))))
>>> .atPath(['w' 'x' 'y' 'z'])
1
```

A one element path at a matrix:

```
>>> ['w' 'x'; 'y' 'z'].atPath([2])
['y' 'z']
```

A two element path at a matrix:

```
>>> ['w' 'x'; 'y' 'z'].atPath([1 2])
'x'
```

The infix form is @>.

```
>>> (w: (x: (y: (z: 1)))) @> ['w' 'x' 'y' 'z']
1
```

_Rationale_: There are two distinct kinds of collection index lookups,
`atPath` and `atAll`.

* * *

See also: @>, at, atAll, atPathPut

Guides: Indexing Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Pick)

Categories: Accessing
