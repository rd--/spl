# asTuple

- _asTuple(anObject)_

Composite types may provide an `asTuple` method to answer a `Tuple` form of the value.

At `CartesianCoordinates`:

```
>>> CartesianCoordinates(1, 3, 5).asTuple
(1, 3, 5)
```

At `Complex`:

```
>>> 1J3.asTuple
(1, 3)
```

At `Fraction`:

```
>>> 1/3.asTuple
(1, 3)
```

At `List`:

```
>>> [1 3 5].asTuple
(1, 3, 5)
```

At `SphericalCoordinates`:

```
>>> SphericalCoordinates(1, 3, 5).asTuple
(1, 3, 5)
```

* * *

See also: asList

Categories: Converting
