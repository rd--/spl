# repeatedTiming

- _repeatedTiming(f:/1, t)_

Evaluate _f_ repeatedly for at least _t_ second,
answering a list of the average time in seconds used, together with the result obtained.

Time a simple addition:

```
>>> let [t, r] = { 1 + 1 }.repeatedTiming(0.1);
>>> (t < 0.00001, r)
(true, 2)
```

Time a slower function:

```
>>> let [t, r] = { [1 .. 10000].sum }.repeatedTiming(0.1);
>>> (t < 0.005, r)
(true, 50005000)
```

* * *

See also: absoluteTime, sessionTime, timing, trimmedMean

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RepeatedTiming.html)
