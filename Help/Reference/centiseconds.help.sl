# centiseconds

- _centiseconds(x)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 1.centiseconds
Quantity(0.01, 'seconds')

>>> 18000.centiseconds
3.minutes
```

At `Duration`,
answer the number of complete centiseconds:

```
>>> 5.minutes.asDuration.centiseconds
3000

>>> 3.hours.asDuration.centiseconds
3 * 60 * 60 * 10
```

* * *

See also: asSeconds, Duration, hours, seconds, minutes

Categories: Time, Type
