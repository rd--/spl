# randomFloat

- _randomFloat(low, high)_
- _randomFloat(alpha)_ => _randomFloat(0, alpha)_

Generate a random number between _low_ and _high_.

Uniform distribution, bi-polar:

```
({ randomFloat(-1, 1) } ! 99).plot
```

Uni-polar:

```
({ randomFloat(1) } ! 99).plot
```

* * *

See also: atRandom, nextRandomFloat, randomInteger, Random, System
