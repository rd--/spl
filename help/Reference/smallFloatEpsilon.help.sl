# smallFloatEpsilon

- _smallFloatEpsilon(aNumber)_

Answers the smallest number that may be added to `one` to make a number greater than one.

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

* * *

See also: Numerical Precision, SmallFloat
