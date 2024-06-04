# unixTimeInMilliseconds

- _unixTimeInMilliseconds(aSystem | aTimeStamp | aNumber)_

At `System`, get the current time in milliseconds since the Unix epoch as a `SmallFloat`.

```
>>> system.unixTimeInMilliseconds > 1671935015392
true

>>> let t1 = system.unixTimeInMilliseconds;
>>> let t2 = system.unixTimeInMilliseconds;
>>> t2 - t1
0
```

At `TimeStamp`, answer into the number of milliseconds since the Unix epoch.

```
>>> let t1 = system.unixTimeInMilliseconds;
>>> let t2 = system.now.unixTimeInMilliseconds;
>>> t2 - t1
0
```

At `Number`, the identity function.

```
>>> 1671935015392.unixTimeInMilliseconds
1671935015392
```

* * *

See also: now, Number, System, systemTimeInMilliseconds, TimeStamp

Categories: Time
