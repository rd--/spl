# randomIntegerBipolar

- _randomIntegerBipolar(anInteger)_

Generate a random integer between negative and positive _anInteger_, inclusive:

```
>>> let set = Set();
>>> 99.timesRepeat { set.include(3.randomIntegerBipolar) };
>>> set
(-3 .. 3).asSet
```

* * *

See also: randomFloatBipolar

Categories: Random number generator
