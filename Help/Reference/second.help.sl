# second

- _second(x)_

At `Collection`,
answer the second element of the sequence _x_:

```
>>> [1 2 3].second
2
```

At `DateAndTime`,
answer the second field:

```
>>> let s = '2024-03-04T21:41:07.500Z';
>>> let t = s.parseDateAndTime;
>>> (t.second, t.wholeSecond, t.millisecond)
(7.5, 7, 500)
```

* * *

See also: Date, dayOfMonth, first, hour, minute, month, parseDateAndTime, secondLast, Sequence, year

References:
_Smalltalk_
5.8.1.25

Categories: Accessing, Time, Type
