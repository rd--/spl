# randomChoice

- _randomChoice(r, e, n)_
- _randomChoice(r, e, w, n)_

Select _n_ elements at random from _e_ using the random number generator _r_.
If _w_ is given it sets the probablity distribution.
If _r_ is ommitted it is set to _system_.

A list of twenty random choices:

```
>>> Sfc32(10841).randomChoice([1 2 3], 20)
[2 3 3 2 3 1 3 3 1 2 3 1 1 1 3 1 3 3 2 1]
```

A 4×3 array of random choices:


```
>>> Sfc32(81349).randomChoice([1 2 3], [4 3])
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
>>> let r = Sfc32(19743);
>>> let e = [1 2 3 4];
>>> let w = [2 2 5 1];
>>> let n = 100;
>>> let c = r.randomChoice(e, w, n);
>>> c.asBag.sortedElements
[1 -> 18, 2 -> 17, 3 -> 50, 4 -> 15]
```

Generate a random string:

```
>>> Sfc32(37914).randomChoice(['A' 'C' 'G' 'T'], 50).join
'TTCGGAGGGCCCCGCAGATCTAAGTATTACCCTGGGTGTGAACTTACACT'
```

Generate a weighted random string:

```
>>> Sfc32(38014).randomChoice(['.' '-'], [2 1], 50).join
'---..-...--.....-........--.--...-.-....--.....--.'
```

Choose 48 characters randomly and with replacement from the sequence _ACGT_,
according to the specified probabilities.

```
>>> let r = Sfc32(36814);
>>> let e = 'ACGT'.contents;
>>> let w = [0.15 0.35 0.35 0.15];
>>> r.randomChoice(e, w, 48).join
'CTTGTAGGGTCCCGGAGGTCGCGGCAGGGGTCAGGAGTGGTTCCATCC'
```

Generate integers according to a _1 / n_ distribution:

```
>>> Sfc32(38014).randomChoice(1:10, 1 / 1:10, 30)
[
	3  9 10  1  4  2  4  3  3  7
	6  2  2  2  1  4  3  2  5  1
	1  2  1  2  4  7  9  1 10  1
]
```

Generate a random 9×9 matrix of `zero` and `one` entries:

```
>>> Sfc32(97415).randomChoice([0 1], [9 9])
[
	0 0 1 0 0 1 0 0 0;
	1 1 1 0 0 1 0 0 1;
	0 0 0 1 0 0 1 0 1;
	0 1 1 1 0 1 0 1 1;
	1 0 0 1 1 1 0 1 0;
	0 1 1 1 0 1 0 1 1;
	1 1 1 1 0 1 0 1 1;
	1 1 1 0 0 0 0 1 0;
	0 0 1 0 0 1 1 1 1
]
```

Plot a random walk with steps of unit length:

~~~
Sfc32(28974).randomChoice([-1 1], 50).accumulate.plot
~~~

* * *

See also: anyOne, atRandom, randomInteger, randomSample

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/Random/#Base.rand),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html),
_Mathworks_
[1](https://mathworks.com/help/stats/randsample.html),
_Python_
[1](https://docs.python.org/3/library/random.html#random.choices),
_R_
[1](https://search.r-project.org/R/refmans/base/html/sample.html)

Categories: Random
