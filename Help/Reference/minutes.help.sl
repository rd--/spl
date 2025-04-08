# minutes

- _minutes(t)_

At `SmallFloat`,
answer a `Quantity` value:

```
>>> 9.minutes
Quantity(540, 'seconds')

>>> 5.minutes
(5 * 60).seconds
```

At `Quantity`,
answer the number of complete minutes:

```
>>> 3.hours.minutes
180

>>> 2.days.minutes
(2 * 24 * 60)
```

* * *

See also: hours, milliseconds, Quantity, seconds

References:
_Smalltalk_
5.8.2.12

Categories: Time, Type
