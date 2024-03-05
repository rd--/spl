# nextRandomInteger

- _nextRandomInteger(aRandom, lowerBound, upperBound)_
- _nextRandomInteger(alpha, beta)_ => _nextRandomInteger(alpha, 1, beta)_

Answer the next random number at _aRandom_ scaled to lie between _lowerBound_ and _upperBound_.

```
>>> let r = Random(12345);
>>> { r.nextRandomInteger(1, 9) } ! 5
[8 5 9 9 4]
```

* * *

See also: atRandom, nextRandomFloat, randomInteger

Categories: Random
