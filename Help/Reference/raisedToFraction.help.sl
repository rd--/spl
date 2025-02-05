# raisedToFraction

- _raisedToFraction(aNumber, aFraction)_

Special case of _^_ where the exponent is a fraction.
Answers _aNumber_ raised to _aFraction_.

At `Fraction`:

```
>>> 3/1.raisedToFraction(2/1)
9/1

>>> 3 ^ 2
9

>>> 9/1.raisedToFraction(1/2)
3/1

>>> 9 ^ 0.5
3

>>> 1/9.raisedToFraction(3/2)
1/27

>>> (1 / 9) ^ (3 / 2)
0.0370370
```

`^` at `Fraction` utilises `raisedToFraction`:

```
>>> 1/9 ^ 3/2
1/27
```

`^` at `SmallFloat` utilises `raisedToFraction`:

```
>>> (4 ^ 3/2, 4 ^ 1.5)
(8/1, 8)

>>> (-8/1 ^ -2/3, (-8 ^ (-2 / 3)).isNaN)
(1/4, true)
```

The answer may not be a `Fraction`:

```
>>> 2/1.raisedToFraction(1/2)
2.sqrt
```

* * *

See also: ^, raisedToInteger
