# timing

- _timing(f/0)_

Answers the number of seconds required to evaluate the block _f_.

Time summing a `Range`:

```
>>> let [t, r] = {
>>> 	1L:123456L.sum
>>> }.timing;
>>> (t < 0.001, r)
(true, 7620753696/1)
```

Time summing a `List`:

```
>>> let [t, r] = {
>>> 	[1L .. 123456L].sum
>>> }.timing;
>>> (t < 0.1, r)
(true, 7620753696L)
```

Timing computing a prime number:

```
>>> let [t, r] = {
>>> 	3579.prime
>>> }.timing;
>>> (t >= 0, t < 1.25, r)
(true, true, 33413L)
```

* * *

See also: absoluteTime, repeatedTiming, sessionTime

Guides: Benchmarking Functions, Date and Time Functions, System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Timing.html)
