# centiseconds

- _centiseconds(x)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 1.centiseconds
Quantity(0.01, 'seconds')

>>> 18000.centiseconds
3.minutes
```

At `Quantity`,
answer the number of complete centiseconds:

```
>>> 5.minutes.centiseconds
3000

>>> 3.hours.centiseconds
3 * 60 * 60 * 10
```

* * *

See also: asSeconds, hours, Quantity, seconds, minutes

Categories: Time, Type
