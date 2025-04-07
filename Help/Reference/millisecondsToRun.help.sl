# secondsToRun

- _secondsToRun(alpha)_ ⟹ _secondsToRun(system, alpha)_
- _secondsToRun(aSystem, aBlock:/0)_

Answers the number of seconds required to evaluate _aBlock:/0_.

```
>>> let t = {
>>> 	3579.nthPrime
>>> }.millisecondsToRun;
>>> t >= 0 & { t < 1.25 }
true
```

* * *

See also: sessionTime

Categories: Timing
