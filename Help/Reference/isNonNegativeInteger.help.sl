# isNonNegativeInteger

- _isNonNegativeInteger(anObject)_

Answer `true` if _anObject_ is an integer and is greater than or equal to `zero`.

```
>>> 23.isNonNegativeInteger
true

>>> 0.isNonNegativeInteger
true
```

Other values anwser `false`:

```
>>> 2.3.isNonNegativeInteger
false

>>> -1.isNonNegativeInteger
false

>>> Infinity.isNonNegativeInteger
false

>>> NaN.isNonNegativeInteger
false
```

* * *

See also: >=, isInteger, isNonNegative, zero

Guides: Integer Functions
