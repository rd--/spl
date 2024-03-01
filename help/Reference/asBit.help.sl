# asBit

- _asBit(aBoolean)_

The numerical interpretation of _aBoolean_ as a one-bit number.
This extends nicely to _n_-bit numbers, as long as they treat 0 as `false`, and anything else as `true`.

```
>>> false.asBit
0

>>> true.asBit
1
```

* * *

See also: asBoolean, boole, Boolean
