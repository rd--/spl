# isBit

- _isBit(x)_

Answer `true` if the number _x_ is `zero` or `one`.

At `Float`:

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
>>> let n = 1.0E-53;
>>> (n.isBit, n.isVeryClose(0.0))
(false, true)
```

Threads over lists:

```
>>> [-1 0 1 2].isBit
[false true true false]
```

To decide if a list has only zeroes use `allTrue` or `deepAllTrue`:

```
>>> [0 1 0].allTrue(isBit/1)
true
```

* * *

See also: isByte, isEven, isNegative, isOdd, isOne, isOrigin, isPositive, isZero

Guides: Predicate Functions

Categories: Testing, Math
