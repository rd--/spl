# minutes

- _minutes(t)_

At `SmallFloat`:

```
>>> 5.minutes
Quantity(5 * 60, 'seconds')

>>> 9.minutes
Quantity(540, 'seconds')
```

At `Duration`,
answer the number of complete minutes:

```
>>> 3.hours.asDuration.minutes
180

>>> 2.days.asDuration.minutes
(2 * 24 * 60)
```

* * *

See also: Duration, hours, milliseconds, seconds

References:
_Smalltalk_
5.8.2.12

Categories: Time, Type
