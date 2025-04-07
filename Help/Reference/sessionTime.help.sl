# sessionTime

- _sessionTime(aSystem)_

Answer the total number of seconds of real time that have elapsed since the beginning of the current session.
This clock may be more accurate that the clock read by `absoluteTime`.

```
>>> let t = system.sessionTime;
>>> (t.isSmallFloat, t > 0)
(true, true)
```

* * *

See also: absoluteTime, System

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SessionTime.html)
