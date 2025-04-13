# uncheckedAt

- _uncheckedAt(aCollection, anIndex)_

Unchecked lookup.
In general answers `nil` for invalid indices,
however the behaviour is undefined.

```
>>> [1 3 5 7 9]
>>> .uncheckedAt(3)
5

>>> (x: 1, y: 2, z: 3)
>>> .uncheckedAt('x')
1
```

Out of bounds integer indices answer `nil`:

```
>>> [1 3 5 7 9]
>>> .uncheckedAt(13)
nil

>>> (x: 1, y: 2, z: 3)
>>> .uncheckedAt('u')
nil
```

Non-integer indices answer `nil`:

```
>>> [1 .. 9].uncheckedAt(1.pi)
nil
```

String indices answer `nil`:

```
>>> [1 .. 9].uncheckedAt('x')
nil
```

* * *

See also: at, uncheckedAtPut

Guides: Slot Access Syntax

Categories: Accessing
