# isScalar

- _isScalar(x)_

Answer `true` if the number _x_ is a scalar number, else `false`.

```
>>> gcd(17, 23).isScalar
true

>>> SinOsc(440, 0).isScalar
false

>>> { [1 2 3].isScalar }.hasError
true
```

_Rationale_:
`isNumber` is defined at `Object`,
`isScalar` is defined at `Number`.

* * *

See also: isInteger, isNumber, isSmallInteger, isVector

Guides: Predicate Functions
