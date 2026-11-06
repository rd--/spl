# isOne

- _isOne(x)_

Answer `true` if the number _x_ is `one`.

At `SmallFloat`:

```
>>> 1.isOne
true

>>> 0.isOne
false

>>> 1.pi.isOne
false
```

Note that the literal notation _1.0_ is defined to _not be equal to one_:

```
>>> 1.0.isOne
false
```

At `Complex`:

```
>>> 1J0.isOne
true
```

At `Decimal`:

```
>>> 1D.isOne
true
```

Note the rule if `scale` is not zero:

```
>>> 1.0D.isOne
false
```


* * *

See also: isEven, isNegative, isOdd, isPositive, isZero, one

Guides: Integer Functions

Categories: Testing, Math
