# randomFloat -- random number generator

- _randomFloat(aRandom | aSystem)_

Generate a random number between zero (inclusive) and one (exclusive).

- _randomFloat(high)_: generate a random number between zero and high
- _randomFloat(low, high)_: generate a random number between low and high

Uniform distribution:

```
({ randomFloat(-1, 1) } ! 99).plot
```

* * *

See also: atRandom, randomInteger, Random, System
