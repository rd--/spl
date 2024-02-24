# smallFloatEpsilon

- _smallFloatEpsilon(aSystem)_

`smallFloatEpsilon` answers the smallest number that may be added to one to make a number greater than one.

```
>>> let x = system.smallFloatEpsilon;
>>> (1 + x) > x
true

>>> let x = 2 ^ -53;
>>> (1 + x) = 1
true
```

* * *

See also: Numerical Precision, SmallFloat
