# uncheckedAt

- _uncheckedAt(c, i)_

Unchecked lookup of the collection _c_ at the index _i_.
In general answers `nil` for invalid indices,
however the behaviour is undefined.

Lookup and existing index:

```
>>> [1 3 5 7 9]
>>> .uncheckedAt(3)
5

>>> (x: 1, y: 2, z: 3)
>>> .uncheckedAt('x')
1

>>> [1: 'x', 2: 'y', 3: 'z']
>>> .uncheckedAt(3)
'z'
```

Out of bounds indices answer `nil`:

```
>>> [1 3 5 7 9]
>>> .uncheckedAt(13)
nil

>>> (x: 1, y: 2, z: 3)
>>> .uncheckedAt('u')
nil

>>> [1: 'x', 2: 'y', 3: 'z']
>>> .uncheckedAt(0)
nil
```

At `List`,
non-integer indices answer `nil`:

```
>>> [1 .. 9].uncheckedAt(1.pi)
nil
```

At `List`,
string indices answer `nil`:

```
>>> [1 .. 9].uncheckedAt('x')
nil
```

* * *

See also: at, uncheckedAtPut

Guides: Slot Access Syntax

Categories: Accessing
