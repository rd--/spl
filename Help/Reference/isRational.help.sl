# isRational

- _isRational(aNumber | aTuning)_

At `Number`,
answer `true` if the number is either an `Integer` or a `Fraction`.

```
>>> 23.isRational
true

>>> 23n.isRational
true

>>> 1/2.isRational
true

>>> 0.5.isRational
false

>>> 2J3.isRational
false
```

At `Tuning`,
answer `true` if the tuning,
when considered `asRatios`, answers only proper fractions.

```
>>> [1/1 6/5 4/3 3/2 8/5]
>>> .asRatioTuning
>>> .isRational
true

>>> ([0 2 4 5 7 9 11] * 100)
>>> .asCentsTuning
>>> .isRational
false
```

* * *

See also: asRatios, CentsTuning, RatioTuning, Tuning

Categories: Testing, Tuning
