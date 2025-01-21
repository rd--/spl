# isNormal

- _isNormal(aRange)_

A `Range` is normal if it is proper,
and if the `start` value is less than or equal to the `stop` value:

```
>>> let r = 1:9;
>>> (r.isProper, r.start, r.stop, r.isNormal)
(true, 1, 9, true)
```

* * *

See also: isProper, Range, start, stop
