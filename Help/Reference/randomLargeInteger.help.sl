# randomLargeInteger

- _randomLargeInteger(r, [min max], ⍴)_

Random `LargeInteger` number generator.
Generate an array of shape _⍴_ containing random large integers between _min_ and _max_.

At `LargeInteger`:

```
>>> Sfc32(36814)
>>> .randomLargeInteger(
>>> 	[1, 2L ^ 99L],
>>> 	[1]
>>> )
[
	115777880821482561199158557812L
]

>>> Sfc32(37914)
>>> .randomLargeInteger(
>>> 	[2L ^ 98, 2L ^ 99],
>>> 	[3]
>>> )
[
	629038020770705179907744355227L
	617042161714087101872431446458L
	605496568649108732708844194715L
]
```

* * *

See also: atRandom, randomByteArray, randomInteger, randomReal, randomSample

Guides: Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random
