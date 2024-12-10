# randomLargeInteger

- _randomLargeInteger(r, α)_ ⇒ _randomInteger(r, 1, α)_
- _randomLargeInteger(r, min, max)_
- _randomLargeInteger(r, min, max, countOrShape)_

Random `LargeInteger` number generator.
Generate a random integer between _min_ and _max_.

At `LargeInteger`:

```
>>> Sfc32(36814)
>>> .randomLargeInteger(2n ^ 99n)
115777880821482561199158557812n

>>> Sfc32(37914)
>>> .randomLargeInteger(
>>> 	2n ^ 98,
>>> 	2n ^ 99
>>> )
629038020770705179907744355227n
```

* * *

See also: atRandom, randomByteArray, randomInteger, randomReal, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random
