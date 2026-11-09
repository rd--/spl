# isOne

- _isOne(x)_

Answer `true` if the number _x_ is `one`.

At `Float`:

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
>>> let x = 1D;
>>> (x.isOne, x = x.one, x = 1)
(true, true, true)
```

Note the rule if `scale` is not zero:

```
>>> let x = 1.000D;
>>> (x.isOne, x = x.one, x = 1)
(true, true, false)
```


* * *

See also: isEven, isNegative, isOdd, isPositive, isZero, one

Guides: Integer Functions

Categories: Testing, Math
