# absoluteTime

- _absoluteTime(x)_

At `System`,
answer the current time as the number of seconds since 1 January, 1970:

```
>>> let t = system.absoluteTime;
>>> t > 1671935015
true

>>> let t1 = system.absoluteTime;
>>> let t2 = system.absoluteTime;
>>> t2 - t1
0
```

At `Date` answer the signed distance in seconds from 1 January, 1970:

```
>>> '2025-04-07'.parseDate.absoluteTime
1743984000

>>> '1900-01-01'.parseDate.absoluteTime
-2208988800
```

At `TimeStamp`, answer the signed distance in seconds from 1 January, 1970:

```
>>> let t1 = system.absoluteTime;
>>> let t2 = system.now.absoluteTime;
>>> t2 - t1
0
```

At `Number`, answer the identity function:

```
>>> 1671935015.absoluteTime
1671935015
```

* * *

See also: currentDate, Date, now, Number, sessionTime, System, TimeStamp

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AbsoluteTime.html)

Categories: Time
