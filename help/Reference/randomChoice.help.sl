# randomChoice

- _randomChoice(e, n, r)_
- _randomChoice(w -> e, n, r)_

Select _n_ elements at random from _e_ using the random number generator _r_.
If _w_ is given it sets the probablity distribution.
If _r_ is ommitted it is set to _system_.

A list of twenty random choices:

```
>>> [1 2 3].randomChoice(20, Sfc32(10841))
[2 3 3 2 3 1 3 3 1 2 3 1 1 1 3 1 3 3 2 1]
```

A 4×3 array of random choices:


```
>>> [1 2 3].randomChoice([4 3], Sfc32(81349))
[
	2 2 3;
	3 2 1;
	1 3 2;
	3 3 1
]
```

Choices weighted with probabilities,
weights are automatically normalized:

```
>>> let w = [2 2 5 1];
>>> let e = [1 2 3 4];
>>> let n = 100;
>>> let r = Sfc32(19743);
>>> let c = (w -> e).randomChoice(n, r);
>>> c.asBag.sortedElements
[1 -> 18, 2 -> 17, 3 -> 50, 4 -> 15]
```

Generate a random string:

```
>>> ['A' 'C' 'G' 'T'].randomChoice(50, Sfc32(37914)).join
'TTCGGAGGGCCCCGCAGATCTAAGTATTACCCTGGGTGTGAACTTACACT'
```

Generate a weighted random string:

```
>>> ([2 1] -> ['.' '-']).randomChoice(50, Sfc32(38014)).join
'---..-...--.....-........--.--...-.-....--.....--.'
```

Generate integers according to a _1 / n_ distribution:

```
>>> ((1 / 1:10) -> 1:10).randomChoice(30, Sfc32(38014))
[
	3 9 10 1 4 2 4 3  3 7
	6 2  2 2 1 4 3 2  5 1
	1 2  1 2 4 7 9 1 10 1
]
```

Plot a random walk with steps of unit length:

~~~
[-1 1].randomChoice(50, Sfc32(28974)).accumulate.plot
~~~

* * *

See also: anyOne, atRandom, randomInteger, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random
