# arithmeticoGeometricSequence

- _arithmeticoGeometricSequence(n, a, d, b, r)_

Answer an _n_-place arithmetico-geometric sequence,
which is the elementwise multiplication an arithmetic progression _(a,d)_ and a geometric progression _(b,r)_.

```
>>> 13.arithmeticoGeometricSequence(
>>> 	0, 1, 1, 1/2
>>> )
[
	0/1 1/2 1/2 3/8 1/4
	5/32 3/32 7/128 1/32 9/512
	5/512 11/2048 3/1024
]
```

Series of the form below,
the first called Gabriel’s staircase,
tell the number of failed trials in a Bernoulli processes with success probability _p_:

```
>>> let p = 1/2;
>>> 23.arithmeticoGeometricSequence(
>>> 	0, 1, p / (1 - p), 1 - p
>>> ).sum
2

>>> let p = 1/6;
>>> 67.arithmeticoGeometricSequence(
>>> 	0, 1, p / (1 - p), 1 - p
>>> ).sum
6
```

* * *

See also: arithmeticGeometricMean, arithmeticProgression, geometricProgression

References:
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic%E2%80%93geometric_mean)
