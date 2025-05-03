# second

- _second(aSequence | aDateAndTime)_

Answer the second element of _aSequence_:

```
>>> [1 2 3].second
2
```

or the second of `DateAndTime`:

```
>>> let s = '2024-03-04T21:41:07.500Z';
>>> let t = s.parseDateAndTime;
>>> (t.second, t.wholeSecond, t.millisecond)
(7.5, 7, 500)
```

* * *

See also: Date, dayOfMonth, first, hour, minute, month, parseDateAndTime, Sequence, year

References:
_Smalltalk_
5.8.1.25

Categories: Accessing, Time, Type
