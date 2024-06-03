# randomChoice

- _randomChoice(r, e, n)_

Select _n_ elements at random from _e_ using the random number generator _r_.

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

Generate a random string:

```
>>> Sfc32(37914).randomChoice(['A' 'C' 'G' 'T'], 50).join
'TTCGGAGGGCCCCGCAGATCTAAGTATTACCCTGGGTGTGAACTTACACT'
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
