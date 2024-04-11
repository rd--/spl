# randomSample

- _randomSample(aCollection, anInteger)_

Answer a pseudo-random sample of _anInteger_ elements of _aCollection_.

Do not sample any of _aCollection_ more than once.

Find a sample in which no elements ever occur more than once:

```
>>> let l = 1:30.randomSample(20);
>>> (l.mean.betweenAnd(10, 20), l.standardDeviation.betweenAnd(5, 10), l.nub.size)
(true, true, 20)
```

Generate a random permutation:

```
>>> let l = 1:20.randomSample(20);
>>> (l.mean, l.standardDeviation, l.nub.size)
(10.5, 5.91608, 20)
```

Generate a random sample of 6 elements, or as many as there are if fewer:

```
>>> let l = 1:5.randomSample(6);
>>> (l.size, l.sorted)
(5, [1 2 3 4 5])
```

Guarantee that a set of random integers over a large range has no repetitions:

```
>>> (1 .. 99999999).randomSample(4).nub.size
4
```

* * *

See also: atRandom

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomSample.html)
