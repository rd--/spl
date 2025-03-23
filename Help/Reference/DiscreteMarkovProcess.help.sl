# DiscreteMarkovProcess

- _DiscreteMarkovProcess(p0, m)_

A `Type` that represents represents a discrete-time finite-state Markov process,
with transition matrix _m_,
and initial state probability vector _p0_.

Define a discrete Markov process:

~~~spl svg=A
DiscreteMarkovProcess(
	[1 0 0],
	[0 0.5 0.5; 0.5 0 0.5; 0.5 0.5 0]
).randomFunction([0 10], 1, Sfc32(673814))
.discretePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-A.svg)

Define a discrete Markov process,
begin at state three,
simulate five processes to twenty places:

~~~spl svg=B
DiscreteMarkovProcess(
	[0 0 1 0],
	[
		0.5 0.5 0 0;
		0.5 0.5 0 0;
		0.25 0.25 0.25 0.25;
		0 0 0 1
	]
).randomFunction([0 12], 5, Sfc32(791479))
.linePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-B.svg)

Model the process of tossing a coin repeatedly,
using a discrete Markov process where the probability of getting heads is 0.6 and getting tails is 0.4,
and simulate 50 coin tosses:

~~~spl svg=C
DiscreteMarkovProcess(
	[1 0],
	[0.6 0.4; 0.4 0.6]
).randomFunction([0 49], 1, Sfc32(789132))
.discretePlot
~~~

![](sw/spl/Help/Image/DiscreteMarkovProcess-C.svg)

* * *

See also: ContinuousMarkovProcess, Graph, HiddenMarkovProcess, randomFunction

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiscreteMarkovProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Discrete-time_Markov_chain)
