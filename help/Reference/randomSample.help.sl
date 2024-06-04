# randomSample

- _randomSample(aRandomNumberGenerator, aCollection, anInteger)_

Answer a pseudo-random sample of _anInteger_ elements of _aCollection_.

Do not sample any of _aCollection_ more than once.

Find a sample in which no elements ever occur more than once:

```
>>> let l = Sfc32(36814).randomSample(1:30, 20);
>>> (
>>> 	l.mean,
>>> 	l.standardDeviation,
>>> 	l.nub.size,
>>> 	l
>>> )
(
	16.4,
	9.1272,
	20,
	[14 15 29 18 24 9 19 28 7 3 27 23 21 6 30 2 16 11 22 4]
)
```

Generate a random permutation:

```
>>> let l = Sfc32(49135).randomSample(1:20, 20);
>>> (l.mean, l.standardDeviation, l.nub.size, l)
(10.5, 5.91608, 20, [1 15 11 13 10 2 4 14 7 12 5 20 6 17 3 19 8 18 16 9])
```

Generate a random sample of six elements, or as many as there are if fewer:

```
>>> let l = Sfc32(71504).randomSample(1:5, 6);
>>> (l.size, l)
(5, [5 2 1 4 3])
```

Guarantee that a set of random integers over a large range has no repetitions:

```
>>> Sfc32(80158).randomSample(1:99999999, 4).nub
[69186077 38465673 9419531 33425181]
```

* * *

See also: atRandom

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomSample.html)
