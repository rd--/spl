# stochasticVector

- _stochasticVector(c, k)_

Answer the stochastic vector,
also called a probability vector,
given a set _c_ of entries from the state space _(1, k)_.
The vector sums to `one`.

Derive an intitial probablity vector for a Markov process from a list of initial states:

```
>>> [1 7 3 1].stochasticVector(8)
[1/2 0 1/4 0 0 0 1/4 0]
```

* * *

See also: DiscreteMarkovProcess, stochasticMatrix

References:
_W_
[1](https://en.wikipedia.org/wiki/Probability_vector)
