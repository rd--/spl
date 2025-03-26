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

Simulate a continuous-time Markov process:

~~~spl svg=A
let r = Sfc32(793285);
ContinuousMarkovProcess(
	[1 0 0],
	[-2 1 1; 1 -2 1; 1 1 -2]
).randomFunction(r, [0 10], 1)
.stepPlot
~~~

![](sw/spl/Help/Image/ContinuousMarkovProcess-A.svg)

Visualize a sample path:

~~~spl svg=B
let r = Sfc32(793285);
ContinuousMarkovProcess(
	[1 0 0 0 0 0 0 0 0 0],
	[
		-3 3 0 0 0 0 0 0 0 0;
		2 -5 3 0 0 0 0 0 0 0;
		0 2 -5 3 0 0 0 0 0 0;
		0 0 2 -5 3 0 0 0 0 0;
		0 0 0 2 -5 3 0 0 0 0;
		0 0 0 0 2 -5 3 0 0 0;
		0 0 0 0 0 2 -5 3 0 0;
		0 0 0 0 0 0 2 -5 3 0;
		0 0 0 0 0 0 0 2 -5 3;
		0 0 0 0 0 0 0 0 2 -2
	]
).randomFunction(r, [0 17], 1)
.stepPlot
~~~

![](sw/spl/Help/Image/ContinuousMarkovProcess-B.svg)

* * *

See also: DiscreteMarkovProcess, HiddenMarkovProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContinuousMarkovProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Continuous-time_Markov_chain)
