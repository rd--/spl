# isZero

- _isZero(x)_

Answer `true` if the number _x_ is `zero`.

At `SmallFloat`:

```
>>> (0.0.isZero, 0.0 = 0)
(true, true)

>>> (-0.0.isZero, -0.0 = 0)
(true, true)

>>> (1.0.isZero, 1.0 = 0)
(false, false)
```

At `Fraction`:

```
>>> (3/4.isZero, 3/4 = 0)
(false, false)

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
>>> (n.isZero, n.isVeryClose(0))
(false, true)
```

Threads over lists:

```
>>> [0 0 0].isZero
[true true true]
```

To decide if a list has only zeroes use `allSatisfy` or `isOrigin`:

```
>>> [0 0 0].allSatisfy(isZero/1)
true
```

* * *

See also: isEven, isNegative, isOdd, isOne, isOrigin, isPositive, zero

Guides: Predicate Functions

Categories: Testing, Math
