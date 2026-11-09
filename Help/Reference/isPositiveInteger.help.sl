# isPositiveInteger

- _isPositiveInteger(n)_

Answers `true` if the number _n_ is a positive integer.

```
>>> 23.isPositiveInteger
true
```

Zero is not a positive integer:

```
>>> 0.isPositiveInteger
false
```

Negative integers are not positive:

```
>>> -3.isPositiveInteger
false
```

π and _i_ and 1/3 are not integers:

```
>>> 1.pi.isPositiveInteger
false

>>> 1I.isPositiveInteger
false

>>> 1/3.isPositiveInteger
false
```

Not defined at non-number values:

```
>>> {
>>> 	'3'.isPositiveInteger
>>> }.hasError
true
```

* * *

See also: isInteger, isNonNegativeInteger, isNumber, isOdd, isPositiveOddInteger

Guides: Predicate Functions
