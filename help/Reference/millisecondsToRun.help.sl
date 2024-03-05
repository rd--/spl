# millisecondsToRun

- _millisecondsToRun(alpha)_ => _millisecondsToRun(system, alpha)_
- _millisecondsToRun(aSystem, aBlock:/0)_

Answers the number of milliseconds required to evaluate _aBlock:/0_.

```
>>> let t = { 3579.nthPrime }.millisecondsToRun;
>>> t >= 0 & { t < 1000 }
true
```

* * *

See also: systemTimeInMilliseconds

Categories: Timing
