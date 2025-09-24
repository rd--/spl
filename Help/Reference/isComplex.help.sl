# isComplex

- _isComplex(x)_

Answers `true` if the object _x_ is a `Complex`, else `false`.

```
>>> 3J4.isComplex
true

>>> 3.141.isComplex
false
```

_Note_:
This is a `Type` predicate,
real numbers are also complex numbers in that they answer `real` and `imaginary`:

```
>>> 3.141.real
3.141

>>> 3.141.imaginary
0
```

* * *

See also: isNumber, isReal, Complex

Guides: Complex Number Functions, Predicate Functions

Categories: Testing, Math
