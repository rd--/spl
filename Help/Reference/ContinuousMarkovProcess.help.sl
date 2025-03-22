# ContinuousMarkovProcess

- _ContinuousMarkovProcess(p0, q)_

A `Type` representing a continuous-time finite-state Markov process with transition rate matrix _q_ and initial state probability vector _p0_.

```
>>> let p = ContinuousMarkovProcess(
>>> 	[1 0 0 0],
>>> 	[
>>> 		-3 1  2  0;
>>> 		3 -6  2  1;
>>> 		4  2 -9  3;
>>> 		0  0  0  0
>>> 	]
>>> );
>>> (
>>> 	p.initialProbabilities,
>>> 	p.holdingTimeMean,
>>> 	p.transitionRateVector,
>>> 	p.transitionMatrix
>>> )
(
	[1 0 0 0],
	[1/3 1/6 1/9 Infinity],
	[3 6 9 0],
	[
		0   1/3 2/3 0;
		1/2 0   1/3 1/6;
		4/9 2/9 0   1/3;
		0   0   0   1
	]
)
```

* * *

See also: DiscreteMarkovProcess, HiddenMarkovProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContinuousMarkovProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Continuous-time_Markov_chain)
