# isNumber

- _isNumber(anObject)_

Answers `true` if _anObject_ is a number, else `false`.

At `SmallFloat`:

```
>>> 3.141.isNumber & { 3.141.isSmallFloat }
true

>>> 23.isNumber & { 23.isSmallFloat & { 23.isInteger } }
true

>>> inf.isNumber & { inf.isSmallFloat & { inf.isFinite.not } }
true
```

At `LargeInteger`:

```
>>> 23n.isNumber & { 23n.isLargeInteger }
true
```

At `Fraction`:

```
>>> 2/3.isNumber & { 2/3.isFraction }
true
```

At `Complex`:

```
>>> 2j3.isNumber & { 2j3.isComplex }
true
```

A `String` is not a number:

```
>>> '23'.isNumber
false
```

* * *

See also: isFinite, isFraction, isInteger, isLargeInteger, isSmallFloat, Number

Categories: Predicate
