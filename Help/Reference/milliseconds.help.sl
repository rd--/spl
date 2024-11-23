# milliseconds

- _milliseconds(aDuration | aNumber)_

Answer the number of complete milliseconds in _aDuration_,
or construct a `Duration` value holding _aNumber_ milliseconds.

```
>>> 5.minutes.milliseconds
300000

>>> 3.hours.milliseconds
(3 * 60 * 60 * 1000)

>>> 180000.milliseconds
3.minutes
```

* * *

See also: asSeconds, Duration, hours, seconds, minutes

Categories: Time, Type
