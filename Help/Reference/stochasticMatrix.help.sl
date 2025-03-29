# stochasticMatrix

- _stochasticMatrix(o)_

Answer the _right_ stochastic matrix describing the transitions of a set of observations _o_.
Each observation in _o_ must be a sequence of integers in _(1, k)_ representing _k_ states,
and there must be at least one transition _from_ each state across the set of observations.
The answer is a _k×k_ matrix where each row sums to `one`.

The stochastic matrix of two sequences of uniformly distributed random integers:

```
>>> let r = Sfc32(167821);
>>> let o = r.randomInteger(1, 5, [2 10]);
>>> (o, o.stochasticMatrix)
(
	[
		3 5 1 5 3 2 4 3 1 2;
		3 2 1 5 2 3 3 3 3 2
	],
	[
		0   1/3 0   0   2/3;
		1/3 0   1/3 1/3 0;
		1/8 3/8 3/8 0   1/8;
		0   0   1   0   0;
		1/3 1/3 1/3 0   0
	]
)
```

* * *

See also: DiscreteMarkovProcess, stochasticVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StochasticMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Stochastic_matrix)
