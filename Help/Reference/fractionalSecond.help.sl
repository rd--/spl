# fractionalSecond

- _fractionalSecond(d)_

Answer the fractional second field of the `DateAndTime` _d_.

```
>>> let s = '2024-03-04T21:41:07.500Z';
>>> let t = s.parseDateAndTime;
>>> (
>>> 	t.fractionalSecond,
>>> 	t.wholeSecond,
>>> 	t.millisecond
>>> )
(7.5, 7, 500)
```

* * *

See also: Date, dayOfMonth, hour, minute, month, parseDateAndTime, year

Guides: Date and Time Functions

References:
_Smalltalk_
5.8.1.25

Categories: Accessing, Time
