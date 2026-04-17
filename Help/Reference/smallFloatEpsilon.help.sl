# smallFloatEpsilon

- _smallFloatEpsilon(n)_

Answers _n_ times the smallest number that may be added to `one` to make a number greater than one.

```
>>> let x = 1.smallFloatEpsilon;
>>> (1 + x) > x
true
```

For numbers smaller than this value the answer will equal `one`:

```
>>> (1 + 0.5.smallFloatEpsilon) = 1
true
```

Value is less than _10^-15_:

```
>>> 1.smallFloatEpsilon < 1E-15
true
```

* * *

See also: epsilon, one, smallFloatMax, SmallFloat

Guides: Numerical Precision

Categories: Math, Constant
