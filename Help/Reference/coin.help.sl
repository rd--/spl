# coin

- _coin(probability)_

Random `Boolean` generator.
Generate a random real number between `zero` and `one` and answers if it is less than _probablity_.

_0.coin_ is always false,
_1.coin_ is always true,
_(1 / 3).coin_ is true one third of the time.

```
>>> 2166136261.seedRandom;
>>> { 1/2.coin } ! 9
[true true false false false false false true true]
```

* * *

See also: randomBit, randomComplex, randomInteger, randomReal

Categories: Random
