# isZero

- _isZero(aNumber)_

Answer `true` if _aNumber_ is `zero`.

At `SmallFloat`:

```
>>> 0.isZero
true

>>> -0.isZero
true

>>> 1.isZero
false
```

At `Fraction`:

```
>>> 3/4.isZero
false

>>> 0/3.isZero
true
```

At `Complex`:

```
>>> 0j0.isZero
true

>>> 0j1.isZero
false
```

Very close to zero but not zero:

```
>>> let n = 1E-53;
>>> (n.isZero, n.veryCloseTo(0))
(false, true)
```

* * *

See also: isEven, isNegative, isOdd, isOne, isPositive, zero

Categories: Testing
