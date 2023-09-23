# atRandom -- random selection

- _atRandom(aCollection)_

Select an element of _aCollection_ at random.

	| c = [1 .. 5]; | c.includes(c.atRandom)
	| c = (1 .. 5); | c.includes(c.atRandom)
	| c = (x: 1, y: 2); | c.values.includes(c.atRandom)
	| c = [1 .. 5].Bag; | c.includes(c.atRandom)
	| c = [1 .. 5].Set; | c.includes(c.atRandom)

- _atRandom(anInteger)_

Select an integer between one and _anInteger_ at random.

	| i = 5.atRandom; | i >= 1 & { i <= 5 }

* * *

See also: anyOne
