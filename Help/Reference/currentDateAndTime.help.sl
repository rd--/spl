# currentDateAndTime

- _currentDateAndTime(system)_

Answer the current `DateAndTime`.

```
>>> let a = system.currentDateAndTime;
>>> let b = '2026-10-13T09:06:56.145+11:00'.parseDateAndTime;
>>> (a.isDateAndTime, a > b)
(true, true)
```

* * *

See also: Date, DateAndTime, absoluteTime, currentDate, now, sessionTime

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CurrentDate.html)
