# randomIntegerBipolar

- _randomIntegerBipolar(anInteger)_

Generate a random integer between negative and positive _anInteger_, inclusive.

Draw enough random numbers to form complete set:

```
>>> let x = IdentitySet();
>>> 99.timesRepeat {
>>> 	x.include!(3.randomIntegerBipolar)
>>> };
>>> x
(-3 .. 3).IdentitySet
```

* * *

See also: randomRealBipolar

Categories: Random
