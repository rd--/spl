# isInteger

- _isInteger(anObject)_

Answers `true` if _anObject_ is a `Number` and is an `Integer`, else `false`.

At `SmallFloat`:

```
>>> 23.isInteger
true

>>> 3.141.isInteger
false

>>> inf.isInteger
false
```

At `LargeInteger`:

```
>>> 23n.isInteger
true
```

At `Fraction`:

```
>>> 2/3.isInteger
false

>>> 2/2.isInteger
true
```

At `Complex` answers `false`, see `isGaussianInteger`:

```
>>> 2j3.isInteger
false
```

At non-number types answers `false`:

```
>>> '23'.isInteger
false

>>> nil.isInteger
false

>>> false.isInteger
false
```

* * *

See also: Integer, isNumber, isGaussianInteger, isSmallInteger, isLargeInteger, Number, parseInteger

Categories: Predicate, Testing
