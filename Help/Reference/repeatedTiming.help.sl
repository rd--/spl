# repeatedTiming

- _repeatedTiming(f:/0, t)_

Evaluate _f_ repeatedly for at least _t_ seconds,
answering a list of the average time in seconds used, together with the result obtained.

Time a sum over a range,
a range is a small value type and there is a closed form for summation:

```
>>> let [t, r] = {
>>> 	(1 .. 10000).sum
>>> }.repeatedTiming(0.1);
>>> (t < 0.00001, r)
(true, 50005000)
```

Time a sum over a list,
which is a slower function:

```
>>> let [t, r] = {
>>> 	[1 .. 10000].sum
>>> }.repeatedTiming(0.1);
>>> (t < 0.01, r)
(true, 50005000)
```

* * *

See also: absoluteTime, sessionTime, timing, trimmedMean

Guides: Benchmarking Functions, Date and Time Functions, System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RepeatedTiming.html)
