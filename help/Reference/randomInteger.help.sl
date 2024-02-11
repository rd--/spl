# randomInteger

- _randomInteger(min, max)_
- _randomInteger(α)_ ⇒ _randomInteger(1, α)_

Generate a random integer between one and nine, inclusive:

```
>>> let s = Set();
>>> 99.timesRepeat { s.include(9.randomInteger) };
>>> s = 1:9.asSet
true
```

Generate a random integer between 3 and 11, inclusive:

```
>>> let s = Set();
>>> 99.timesRepeat { s.include(3.randomInteger(11)) };
>>> s = 3:11.asSet
true
```

* * *

See also: atRandom, randomFloat, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random number generator
