# randomIntegerBipolar -- random number generator

- _randomIntegerBipolar(anInteger)_

Generate a random integer between negative and positive _anInteger_, inclusive:

	let s = Set(); 99.timesRepeat { s.include(3.randomIntegerBipolar) }; s = (-3 .. 3).asSet

* * *

See also: randomFloatBipolar
