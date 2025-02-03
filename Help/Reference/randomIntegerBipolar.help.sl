# randomIntegerBipolar

- _randomIntegerBipolar(anInteger)_

Generate a random integer between negative and positive _anInteger_, inclusive.

Draw enough random numbers to form complete set:

```
>>> let set = IdentitySet();
>>> 99.timesRepeat {
>>> 	set.include(3.randomIntegerBipolar)
>>> };
>>> set
(-3 .. 3).asIdentitySet
```

* * *

See also: randomRealBipolar

Categories: Random
