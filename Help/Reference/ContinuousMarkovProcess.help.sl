# ContinuousMarkovProcess

- _ContinuousMarkovProcess(p0, q)_
- _ContinuousMarkovProcess(p0, m, μ)_

A `Type` representing a continuous-time finite-state Markov process,
with initial state probability vector _p0_.
The process can be defined by the transition rate matrix _q_,
or by a transition matrix _m_ and transition rate vector μ.

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

Derive the transition matrix from the _q_ matrix:

```
>>> let p0 = [1 0 0 0];
>>> let q = [-6 3 3; 4 -12 8; 15 3 -18];
>>> ContinuousMarkovProcess(p0, q)
>>> .transitionMatrix
[
	0   1/2 1/2;
	1/3 0   2/3;
	5/6 1/6 0
]
```

Specify as transition matrix _m_ and transition rate vector _mu_,
and derive _q_;

```
>>> let p0 = [1 0 0];
>>> let m = [
>>> 	0 1/2 1/2;
>>> 	1/3 0 2/3;
>>> 	5/6 1/6 0
>>> ];
>>> let mu = [6 12 18];
>>> ContinuousMarkovProcess(p0, m, mu)
>>> .q
[-6 3 3; 4 -12 8; 15 3 -18]
```

Generate a sample path,
note that the last item has exactly the specified time:

```
>>> ContinuousMarkovProcess(
>>> 	[1 0], [-3 3; 2 -2]
>>> ).randomFunction(
>>> 	Sfc32(678312), [0 2], 1
>>> ).pathList.first
[
	0.0000 1;
	0.9179 2;
	1.6389 1;
	1.7090 2;
	1.9307 1;
	2.0000 2
]
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
