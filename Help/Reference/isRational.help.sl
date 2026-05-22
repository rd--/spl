# isRational

- _isRational(x)_

At `Number`,
answer `true` if the number is either an `Integer` or a `Fraction`.

At `SmallFloat`:

```
>>> 23.isRational
true

>>> 0.5.isRational
false
```

At `LargeInteger`:

```
>>> 23L.isRational
true
```

At `Fraction`:

```
>>> 1/2.isRational
true
```

At `Complex`:

```
>>> 2J3.isRational
false
```

At `Tuning`,
answer `true` if the tuning,
when considered `asRatios`, answers only proper fractions.

```
>>> RatioTuning[1/1 6/5 4/3 3/2 8/5]
>>> .isRational
true

>>> ([0 2 4 5 7 9 11] * 100)
>>> .asCentsTuning
>>> .isRational
false
```

* * *

See also: asRatios, CentsTuning, isFraction, isInteger, RatioTuning, Tuning

Guides: Number Functions, Predicate Functions, Tuning Functions

Categories: Testing, Tuning
