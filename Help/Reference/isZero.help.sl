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
>>> 0J0.isZero
true

>>> 0J1.isZero
false
```

Very close to zero but not zero:

```
>>> let n = 1E-53;
>>> (n.isZero, n.isVeryCloseTo(0))
(false, true)
```

Threads over lists:

```
>>> [0 0 0].isZero
[true true true]
```

To decide if a list has only zeros use `allSatisfy` or `isOrigin`:

```
>>> [0 0 0].allSatisfy(isZero:/1)
true
```

* * *

See also: isEven, isOrigin, isNegative, isOdd, isOne, isPositive, zero

Categories: Testing, Math
