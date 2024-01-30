# randomInteger -- random number generator

- _randomInteger(anInteger)_

Generate a random integer between one and _anInteger_, inclusive:

	let s = Set(); 99.timesRepeat { s.include(9.randomInteger) }; s = 1:9.asSet

- _randomInteger(low, high)_

Generate a random integer between _low_ and _high_, inclusive:

	let s = Set(); 99.timesRepeat { s.include(3.randomInteger(11)) }; s = 3:11.asSet

* * *

See also: atRandom, randomFloat
