# signBit

- _signBit(aNumber)_

Answer `one` if _aNumber_ has sign bit set (including case of IEEE-754 negative-zero), else `zero`.

```
>>> [-1 -0 0 1].collect(signBit:/1)
[1 1 0 0]
```

* * *

See also: isNegative, isNegativeZero, sign
