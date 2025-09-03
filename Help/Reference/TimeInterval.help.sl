# TimeInterval

- _TimeInterval(t₁, t₂)_

A `Type` that represents the interval between two time instants,
also called a time span.
The interval is half-open,
it includes _t₁_ and excludes _t₂_.

```
>>> let s1 = '2025-04-07T21:21:00.000Z';
>>> let s2 = '2025-04-07T21:22:00.000Z';
>>> let t1 = s1.parseTimeStamp;
>>> let t2 = s2.parseTimeStamp;
>>> let d1 = Duration(60);
>>> let i1 = TimeInterval(t1, t2);
>>> let i2 = TimeInterval(t1, t1 + d1);
>>> (
>>> 	i1.min,
>>> 	i1.max,
>>> 	i1.duration,
>>> 	i1.absoluteTime,
>>> 	i1.includes(t1),
>>> 	i1.includes(t2),
>>> 	i1 = i2
>>> )
(
	t1,
	t2,
	Duration(60),
	(1744060860 -- 1744060920),
	true,
	false,
	true
)
```

* * *

See also: Duration, Interval, Time, TimeStamp

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateInterval.html)
