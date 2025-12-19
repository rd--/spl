# isBit

- _isBit(x)_

Answer `true` if the number _x_ is `zero` or `one`.

At `SmallFloat`:

```
>>> 0.isBit
true

>>> -0.isBit
true

>>> 1.isBit
true

>>> 2.isBit
false
```

Very close to zero but not zero or one:

```
>>> let n = 1E-53;
>>> (n.isBit, n.isVeryCloseTo(0))
(false, true)
```

Threads over lists:

```
>>> [-1 0 1 2].isBit
[false true true false]
```

To decide if a list has only zeroes use `allSatisfy` or `deepAllSatisfy`:

```
>>> [0 1 0].allSatisfy(isBit:/1)
true
```

* * *

See also: isByte, isEven, isOrigin, isNegative, isOdd, isOne, isPositive, isZero

Guides: Predicate Functions

Categories: Testing, Math
