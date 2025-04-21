# randomWeightedChoice

- _randomWeightedChoice(r, e, w, shape)_

Answer an array of `shape` items selected at random from _e_,
according to the probablity distribution (or weights) at _w_,
using the random number generator _r_.

Choices weighted with probabilities,
if the weights do not sum to `one` they are automatically normalized:

```
>>> let r = Sfc32(19743);
>>> let c = r.randomWeightedChoice(
>>> 	[1 2 3 4],
>>> 	[2 2 5 1],
>>> 	[100]
>>> );
>>> c.asIdentityBag.sortedElements
[1 -> 18, 2 -> 17, 3 -> 50, 4 -> 15]
```

Generate a weighted random string:

```
>>> Sfc32(38014)
>>> .randomWeightedChoice(
>>> 	['.' '-'],
>>> 	[2 1],
>>> 	[50]
>>> ).stringJoin
'---..-...--.....-........--.--...-.-....--.....--.'
```

Choose 48 characters randomly and with replacement from the sequence _ACGT_,
according to the specified probabilities.

```
>>> let r = Sfc32(36814);
>>> r.randomWeightedChoice(
>>> 	'ACGT'.contents,
>>> 	[0.15 0.35 0.35 0.15],
>>> 	[24]
>>> ).stringCatenate
'CTTGTAGGGTCCCGGAGGTCGCGG'
```

Generate a 3×10 matrix of integers according to a _1 / n_ distribution:

```
>>> Sfc32(38014)
>>> .randomWeightedChoice(
>>> 	1:10,
>>> 	1 / 1:10,
>>> 	[3 10]
>>> )
[
	3  9 10  1  4  2  4  3  3  7;
	6  2  2  2  1  4  3  2  5  1;
	1  2  1  2  4  7  9  1 10  1
]
```

* * *

See also: anyOne, atRandom, randomChoice, randomInteger, randomSample

Guides: Random Functions

Categories: Random
