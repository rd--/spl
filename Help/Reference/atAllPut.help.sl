# atAllPut

- _atAllPut(c, x)_
- _atAllPut([x₁ x₂ …], [i₁ i₂ …], y)_

In the binary case,
put the object _x_ at every entry of the collection _c_.
Answer _x_.

At `List`:

```
>>> let l = List(9);
>>> let z = l.atAllPut(0);
>>> (l, z)
([0 0 0 0 0 0 0 0 0], 0)
```

At `Record`:

```
>>> let a = (x: 1, y: 2, z: 3);
>>> let b = a.atAllPut(0);
>>> (a, b)
((x: 0, y: 0, z: 0), 0)
```

In the ternary case,
put the object _y_ at every index specified by the elements of _i_ in the sequence _x_.

At `List`:

```
>>> let l = 9.iota;
>>> let z = l.atAllPut([3 .. 7], 0);
>>> (l, z)
([1 2 0 0 0 0 0 8 9], 0)
```

_Note:_
This method imlpements both _atAllPut:_ and _atAll:put:_.

* * *

See also: at, atAll, atAllPutAll, atPut

Guides: List Functions

References:
_Smalltalk_
5.7.12.2
5.7.12.3

Categories: Accessing
