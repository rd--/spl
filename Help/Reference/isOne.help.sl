# isOne

- _isOne(x)_

Answer `true` if the number _x_ is `one`.

At `SmallFloat`:

```
>>> (1.isOne, 1 = 1)
(true, true)

>>> (0.isOne, 0 = 1)
(false, false)

>>> (1.pi.isOne, 1.pi = 1)
(false, false)
```

The literal notation _1.0_ is one:

```
>>> (1.0.isOne, 1.0 = 1)
(true, true)
```

At `Complex`:

```
>>> (1J0.isOne, 1J0 = 1)
(true, true)
```

At `Decimal`:

```
>>> (1D.isOne, 1D = 1)
(true, true)
```

Note the rule if `scale` is not zero:

```
>>> (1.0D.isOne, 1.0D = 1)
(false, false)
```


* * *

See also: isEven, isNegative, isOdd, isPositive, isZero, one

Guides: Integer Functions

Categories: Testing, Math
