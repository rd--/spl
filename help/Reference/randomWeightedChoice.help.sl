# randomWeightedChoice

- _randomWeightedChoice(r, e, w, n)_

Select _n_ elements at random from _e_ using the random number generator _r_.
If _w_ is given it sets the probablity distribution.
If _r_ is ommitted it is set to _system_.

Choices weighted with probabilities,
weights are automatically normalized:

```
>>> let r = Sfc32(19743);
>>> let e = [1 2 3 4];
>>> let w = [2 2 5 1];
>>> let n = 100;
>>> let c = r.randomWeightedChoice(e, w, n);
>>> c.asBag.sortedElements
[1 -> 18, 2 -> 17, 3 -> 50, 4 -> 15]
```

Generate a weighted random string:

```
>>> Sfc32(38014).randomWeightedChoice(['.' '-'], [2 1], 50).stringJoin
'---..-...--.....-........--.--...-.-....--.....--.'
```

Choose 48 characters randomly and with replacement from the sequence _ACGT_,
according to the specified probabilities.

```
>>> let r = Sfc32(36814);
>>> let e = 'ACGT'.contents;
>>> let w = [0.15 0.35 0.35 0.15];
>>> r.randomWeightedChoice(e, w, 48).join
'CTTGTAGGGTCCCGGAGGTCGCGGCAGGGGTCAGGAGTGGTTCCATCC'
```

Generate integers according to a _1 / n_ distribution:

```
>>> Sfc32(38014).randomWeightedChoice(1:10, 1 / 1:10, 30)
[
	3  9 10  1  4  2  4  3  3  7
	6  2  2  2  1  4  3  2  5  1
	1  2  1  2  4  7  9  1 10  1
]
```

* * *

See also: anyOne, atRandom, randomChoice, randomInteger, randomSample

Categories: Random
