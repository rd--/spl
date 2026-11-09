# isNonNegativeInteger

- _isNonNegativeInteger(n)_

Answer `true` if the number _n_ is an integer and is greater than or equal to `zero`.

```
>>> 23.isNonNegativeInteger
true

>>> 0.isNonNegativeInteger
true
```

Other numeric values anwser `false`:

```
>>> 2.3.isNonNegativeInteger
false

>>> -1.isNonNegativeInteger
false

>>> Infinity.isNonNegativeInteger
false

>>> NaN.isNonNegativeInteger
false

>>> 1/3.isNonNegativeInteger
false
```

Not defined at non-number values:

```
>>> {
>>> 	'3'.isNonNegativeInteger
>>> }.hasError
true
```

* * *

See also: >=, isInteger, isNonNegative, zero

Guides: Integer Functions, Number Functions, Predicate Functions
