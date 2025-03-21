# HiddenMarkovProcess

- _HiddenMarkovProcess(p0, m, e)_

A `Type` that represents represents a discrete-time,
finite-state hidden Markov process with transition matrix _m_,
emission matrix _e_,
and initial hidden state probability vector _p0_.

Define a hidden Markov process:

~~~spl svg=A
let p = HiddenMarkovProcess(
	[0.5 0.5],
	[0.7 0.3; 0.25 0.75],
	[0.2 0.6 0.2; 0.4 0.2 0.4]
);
Sfc32(317696)
.randomFunction(p, [0 20 1], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/HiddenMarkovProcess-A.svg)

Use `viterbiDecoding` to find the most likely hidden state sequence from the given emissions:

```
>>> HiddenMarkovProcess(
>>> 	[0.5 0.5],
>>> 	[0.7 0.3; 0.25 0.75],
>>> 	[0.2 0.6 0.2; 0.4 0.2 0.4]
>>> ).viterbiDecoding(
>>> 	[1 1 1 1 1 2 3 3 1 2 2]
>>> )
[2 2 2 2 2 2 2 2 2 1 1]
```

* * *

See also: DiscreteMarkovProcess, Graph, randomFunction, viterbiDecoding

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HiddenMarkovProcess.html)
[2](https://reference.wolfram.com/language/ref/FindHiddenMarkovStates.html),
_W_
[1](https://en.wikipedia.org/wiki/Hidden_Markov_model),
[2](https://en.wikipedia.org/wiki/Viterbi_algorithm)
