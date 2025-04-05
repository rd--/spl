# days

- _days(x)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 2.days
Quantity(172800, 'seconds')

>>> 5.days
7200.minutes

>>> 3.days
(3 * 24).hours

>>> 21.days
3.weeks
```

At `Duration`.
answer the number of complete days:

```
>>> 3.weeks.asDuration.days
21
```

* * *

See also: asSeconds, Duration, hours, seconds, minutes, weeks

Categories: Time, Type
