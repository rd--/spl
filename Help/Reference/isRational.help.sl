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

A `List` is not a rational number:

```
>>> { [1/2 3/4].isRational }.hasError
true

>>> [1/2 3/3].allTrue(isRational/1)
true
```

At `Tuning`,
answer `true` if the tuning,
when considered as ratios,
answers only proper fractions:

```
>>> RatioTuning[1/1 6/5 4/3 3/2 8/5]
>>> .isRational
true

>>> ([0 2 4 5 7 9 11] * 100)
>>> .CentsTuning
>>> .isRational
false
```

* * *

See also: CentsTuning, RatioTuning, Tuning, isFraction, isInteger, ratios

Guides: Number Functions, Predicate Functions, Tuning Functions

Categories: Testing, Tuning
