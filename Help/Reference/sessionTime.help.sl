# sessionTime

- _sessionTime(system)_

Answer the total number of seconds of real time that have elapsed since the beginning of the current session.
This clock may be more accurate that the clock read by `absoluteTime`.

```
>>> let t = system.sessionTime;
>>> (t.isSmallFloat, t > 0)
(true, true)
```

There is a variant form that answers in milliseconds:

```
>>> let a = system.sessionTime;
>>> let b = system.sessionTimeInMilliseconds;
>>> a * 1000
b
```

* * *

See also: System, absoluteTime

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SessionTime.html)
