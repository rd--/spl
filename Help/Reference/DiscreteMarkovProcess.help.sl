# DiscreteMarkovProcess

- _DiscreteMarkovProcess(p0, m)_

A `Type` that represents represents a discrete-time finite-state Markov process,
with transition matrix _m_,
and initial state probability vector _p0_.

Define a discrete Markov process:

~~~spl svg=A
let p = DiscreteMarkovProcess(
	[1 0 0],
	[0 0.5 0.5; 0.5 0 0.5; 0.5 0.5 0]
);
Sfc32(673814)
.randomFunction(p, [0 10 1], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-A.svg)

Define a discrete Markov process,
begin at state three,
simulate five processes to twenty places:

~~~spl svg=B
let p = DiscreteMarkovProcess(
	[0 0 1 0],
	[
		0.5 0.5 0 0;
		0.5 0.5 0 0;
		0.25 0.25 0.25 0.25;
		0 0 0 1
	]
);
Sfc32(791479)
.randomFunction(p, [0 12 1], 5)
.linePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-B.svg)

Model the process of tossing a coin repeatedly,
using a discrete Markov process where the probability of getting heads is 0.6 and getting tails is 0.4,
and simulate 50 coin tosses:

~~~spl svg=C
let p = DiscreteMarkovProcess(
	[1 0],
	[0.6 0.4; 0.4 0.6]
);
Sfc32(789132)
.randomFunction(p, [0 49 1], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-C.svg)

* * *

See also: Graph, randomFunction

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiscreteMarkovProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Discrete-time_Markov_chain)
