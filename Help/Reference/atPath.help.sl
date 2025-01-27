# atPath

- _atPath(aCollection, indices)_

The _indices_ describe a path of accesses into _aCollection_, taken in sequence.

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

* * *

See also: at, atAll

References:
_Apl_
[1](https://aplwiki.com/wiki/Pick)

Categories: Accessing
