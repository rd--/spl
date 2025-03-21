# viterbiDecoding

- _viterbiDecoding(p, o)_

Answer the most likely hidden states of the `HiddenMarkovProcess` _p_ corresponding to the observations (or emissions data) _o_.
Implements the Viterbi algorithm.

```
>>> HiddenMarkovProcess(
>>> 	[0.4 0.3 0.3],
>>> 	[0 0.5 0.5; 0.4 0 0.6; 0.55 0.45 0],
>>> 	[0.7 0.2 0.1; 0.2 0.6 0.2; 0 0.3 0.7]
>>> ).viterbiDecoding(
>>> 	[1 3 2 3 3 2 2 3 2 1 2 2 3 1 2 2]
>>> )
[1 3 2 3 2 3 2 3 2 1 3 2 3 1 2 3]
```

* * *

See also: HiddenMarkovProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindHiddenMarkovStates.html),
_W_
[1](https://en.wikipedia.org/wiki/Viterbi_algorithm)
