# isIntegerArray

- _isIntegerArray(a)_

Answer `true` if the array _a_ is an integer array.

A rank one array, a vector:

```
>>> [1 2 3 4 5 6 7 8].isIntegerArray
true

>>> [1.2 3.4 5.6 7.8].isIntegerArray
false
```

A rank two array, a matrix:

```
>>> [1 2 3 4; 5 6 7 8].isIntegerArray
true

>>> [1.2 3.4; 5.6 7.8].isIntegerArray
false
```

A rank three array:

```
>>> [1 2; 3 4:; 5 6; 7 8].isIntegerArray
true

>>> [1.2; 3.4:; 5.6 7.8].isIntegerArray
false
```

An irregular array is not an array:

```
>>> [1; 2 3; 4 5 6].isIntegerArray
false
```

Element type of `SmallFloat`:

```
>>> [1 2].isIntegerArray
true
```

Element type of `Fraction`:

```
>>> [1/1 2/1; 3/1 4/1].isIntegerArray
true
```

Element type of `Complex`:

```
>>> [1J2 3J4].isIntegerArray
false
```

* * *

See also: isArray, isInteger, isNumber, isScalar, isSmallInteger

Guides: Integer Functions
