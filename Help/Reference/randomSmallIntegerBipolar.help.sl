# randomSmallIntegerBipolar

- _randomSmallIntegerBipolar(n)_

Generate a random integer between negative and positive _n_,
inclusive.

Draw enough random numbers to form complete set:

```
>>> let x = IdentitySet();
>>> 99.timesRepeat {
>>> 	x.include!(3.randomSmallIntegerBipolar)
>>> };
>>> x
(-3 .. 3).IdentitySet
```

* * *

See also: randomRealBipolar

Guides: Random Number Functions
