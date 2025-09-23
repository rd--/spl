# asList

- _asList(x)_

At a `Collection`,
answer a `List` whose elements are the elements of _x_.

If the collection is a `List`, answer it directly.

```
>>> let l = [1 .. 5];
>>> l.asList == l
true
```

At `Tuple`:

```
>>> (1, 2, 3).asList
[1 2 3]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).asList
[1 2 3]

>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At `Association`:

```
>>> (1 -> 3).asList
[1 3]
```

At `Multiset`:

```
>>> [1 2 2 3 3 3 4 4 4 4]
>>> .asMultiset
>>> .asList
[1 2 2 3 3 3 4 4 4 4]
```

At `String`:

```
>>> 'string'.asList
['s' 't' 'r' 'i' 'n' 'g']
```

At `NumericArray` answers the `normal` `List` array:

```
>>> NumericArray([1 2; 3 4; 5 6]).asList
[1 2; 3 4; 5 6]
```

At `Fraction`:

```
>>> 1/3.asList
[1 3]
```

At `Complex`:

```
>>> 1J3.asList
[1 3]
```

At `CartesianCoordinates`:

```
>>> CartesianCoordinates([1 3 5]).asList
[1 3 5]
```

At `SphericalCoordinates`:

```
>>> SphericalCoordinates([1 3 5]).asList
[1 3 5]
```

At `Date`,
answer _(year, month, day, hour, minute, second)_:

```
>>> '2025-04-07T17:07:20.500Z'
>>> .parseDateAndTime
>>> .asList
[2025 04 07 17 07 20.500]
```

At `Duration`,
answer _(days, hours, minutes, seconds)_:

```
>>> 'P4DT12H30M5S'.parseDuration.asList
[4 12 30 5]
```

This should not be defined for scalar values, see `asCollection`.

* * *

See also: copy, List, asCollection

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateList.html),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/xco#dyadic),
_Smalltalk_
5.7.1.3

Categories: Converting
