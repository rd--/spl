# isRealValuedNumber

- _isRealValuedNumber(x)_

Answer `true` if _x_ is a real valued number,
else `false`.

At `Integer`:

```
>>> 23L.isRealValuedNumber
true
```


At `Float`:

```
>>> 3.141.isRealValuedNumber
true

>>> Infinity.isRealValuedNumber
false

>>> NaN.isRealValuedNumber
false
```

At `Fraction`:

```
>>> 1/3.isRealValuedNumber
true
```

At `Decimal`:

```
>>> 3.141D.isRealValuedNumber
true
```

At `Complex`:

```
>>> 1J2.isRealValuedNumber
false

>>> 1J0.isRealValuedNumber
false
```

* * *

See also: isComplex, isFloat, isFraction, isInteger, isIntegerValuedNumber

Guides: Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RealValuedNumberQ.html)
