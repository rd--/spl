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

At `Quantity`,
use `inDays` to answer the number of days:

```
>>> 3.weeks.inDays
21

>>> 12.hours.inDays
0.5
```

* * *

See also: hours, inSeconds, minutes, Quantity, seconds, Time, weeks

Categories: Time, Type
