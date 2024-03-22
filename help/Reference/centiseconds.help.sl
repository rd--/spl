# centiseconds

- _centiseconds(aDuration | aNumber)_

Answer the number of complete centiseconds in _aDuration_,
or construct a `Duration` value holding _aNumber_ centiseconds.

```
>>> 5.minutes.centiseconds
3000

>>> 3.hours.centiseconds
(3 * 60 * 60 * 10)

>>> 18000.centiseconds
3.minutes
```

* * *

See also: asSeconds, Duration, hours, seconds, minutes

Categories: Time, Type
