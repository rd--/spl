# smallFloatMax

- _smallFloatMax(x)_

Answers the largest number that may be represented as a `SmallFloat`.

```
>> system.smallFloatMax
1.7976931348623157E+308
```

This is much, much larger than the largest small integer:

```
>>> system.smallIntegerMax
9_007_199_254_740_991

>>> 2L ^ 53 - 1
9_007_199_254_740_991
```

* * *

See also: SmallFloat, epsilon, one, smallFloatEpsilon

Guides: Numerical Precision

Categories: Math, Constant
