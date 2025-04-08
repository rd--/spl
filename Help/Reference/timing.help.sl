# timing

- _timing(alpha)_ ⟹ _timing(system, alpha)_
- _timing(aSystem, aBlock:/0)_

Answers the number of seconds required to evaluate _aBlock:/0_.

Time summing a `Range`:

```
>>> let [t, r] = { 1:123456.sum }.timing;
>>> (t < 0.001, r)
(true, 7620753696)
```

Time summing a `List`:

```
>>> let [t, r] = { [1 .. 123456].sum }.timing;
>>> (t < 0.1, r)
(true, 7620753696)
```

Timing computing a prime number:

```
>>> let [t, r] = {
>>> 	3579.nthPrime
>>> }.timing;
>>> (t >= 0, t < 1.25, r)
(true, true, 33413)
```

* * *

See also: absoluteTime, sessionTime

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Timing.html)

Categories: Timing
