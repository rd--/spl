# coin

- _coin(r, probability)_

Random `Boolean` generator.
Generate a random real number between `zero` and `one` and answers if it is less than _probablity_.

At `zero`, `coin` is always `false`,
at `one`, `coin` is always `true`,
at one third, `coin` is `true` one third of the time.

```
>>> let r = Sfc32(216613);
>>> { r.coin(0.5) } ! 9
[true true false false true true false true true]
```

* * *

See also: randomBit, randomBoolean, randomComplex, randomInteger, randomReal

Categories: Random
