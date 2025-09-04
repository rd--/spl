# atPut

- _atPut(c, i, x)_
- _atPut(c, i, j, x)_
- _atPut(c, i, j, k, x)_

Store the object _x_ at index _i_ of the indexable collection _c_.
If the collection does not have indexed variables,
or if the argument is not a valid index,
then report an error.
Answer _x_.

In the extended cases _j_ a secondary index and _k_ a tertiary index.

At `List`:

```
>>> let c = [1 2 3];
>>> let x = c.atPut(2, -2);
>>> (x, c)
(-2, [1 -2 3])
```

At `Record`:

```
>>> let c = (x: 1, y: 2, z: 3);
>>> let x = c.atPut('y', -2);
>>> (x, c)
(-2, (x: 1, y: -2, z: 3))
```

In the dictionary case,
the index, or key, must be valid there does not have to be an existing entry:

```
>>> let c = (x: 1, z: 3);
>>> let x = c.atPut('y', -2);
>>> (x, c)
(-2, (x: 1, y: -2, z: 3))
```

There is `AtPut Syntax` for mutating indexed values:

```
>>> let c = [1 2 3];
>>> let x = c[2] := -2;
>>> (x, c)
(-2, [1 -2 3])

>>> let c = (x: 1, y: 2, z: 3);
>>> let x = c['y'] := -2;
>>> (x, c)
(-2, (x: 1, y: -2, z: 3))
```

* * *

See also: at, atPathPut, size

Guides: AtPut Syntax, Dictionary Functions, List Functions, Property Write Syntax

References:
_Smalltalk_
5.7.2.5

Categories: Accessing
