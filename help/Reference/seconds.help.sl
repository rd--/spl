# seconds

- _seconds(aDuration | aNumber)_

Answer the number of complete seconds in _aDuration_,
or construct a `Duration` value holding _aNumber_ seconds.

```
>>> 5.minutes.seconds
300

>>> 3.hours.seconds
(3 * 60 * 60)

>>> 180.seconds
3.minutes
```

* * *

See also: asSeconds, Duration, hours, milliseconds, minutes

References:
_Smalltalk_
5.8.2.17

Categories: Time, Type
