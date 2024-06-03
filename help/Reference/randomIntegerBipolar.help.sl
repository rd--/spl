# randomIntegerBipolar

- _randomIntegerBipolar(anInteger)_

Generate a random integer between negative and positive _anInteger_, inclusive.

```
>>> Sfc32(73614).randomIntegerBipolar(9)
-6
```

Draw enough random numbers to form complete set:

```
>>> let set = Set();
>>> 99.timesRepeat { set.include(system.randomIntegerBipolar(3)) };
>>> set
(-3 .. 3).asSet
```

* * *

See also: randomFloatBipolar

Categories: Random
