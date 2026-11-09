# raisedToFraction

- _raisedToFraction(x, n/d)_

Special case of _^_ where the exponent is a fraction.
Answers the number _x_ raised to the fraction _n/d_.

At `Fraction`:

```
>>> 1/9.raisedToFraction(3/2)
1/27
```

`^` at `Fraction` utilises `raisedToFraction`:

```
>>> 1/9 ^ 3/2
1/27
```

Compare to `^` at `Float`:

```
>>> Float(1/9) ^ 3/2
0.0370370

>>> 1/9 ^ Float(3/2)
0.0370370

>>> (4 ^ 3/2, 4 ^ 1.5)
(8, 8)

>>> -8 ^ -2/3
-0.125J-0.216506
```

The answer may not be a `Fraction`:

```
>>> 1/2.raisedToFraction(1/2)
2.sqrt / 2
```

At `Integer`:

```
>>> 27L ^ 1/3
3/1

>>> 81L ^ 1/2
9/1
```

* * *

See also: ^, raisedToInteger

Guides: Mathematical Functions
