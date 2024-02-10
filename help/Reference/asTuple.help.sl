# asTuple

_asTuple(anObject)_

Composite types may provide an _asTuple_ method to answer a Tuple form of the value.

At CartesianCoordinate:

```
>>> CartesianCoordinate(1, 3, 5).asTuple
(1, 3, 5)
```

At Complex:

```
>>> 1j3.asTuple
(1, 3)
```

At Fraction:

```
>>> 1/3.asTuple
(1, 3)
```

At List:

```
>>> [1 3 5].asTuple
(1, 3, 5)
```

At SphericalCoordinate:

```
>>> SphericalCoordinate(1, 3, 5).asTuple
(1, 3, 5)
```

* * *

See also: asList

Category: Converting
