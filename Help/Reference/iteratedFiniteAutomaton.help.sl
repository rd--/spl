# iteratedFiniteAutomaton

- _iteratedFiniteAutomaton(r, s₀, [i₁ i₂ …], t)_

Answer a list representing the evolution of the iterated finite automaton specified by the rule _r_ with initial state _s₀_ and initial condition _i_ for _t_ steps.
The rule _r_ is an association list mapping input _(s,i)_ pairs to output _(s,i)_ pairs.
The state is reset to s₀ at the start of each iteration.

A rule that, given _s=1_ and _i=0,0,0,0_ returns to _i_ after eight steps:

```
>>> [
>>> 	[1 1] -> [1 0],
>>> 	[1 0] -> [2 1],
>>> 	[2 1] -> [2 1],
>>> 	[2 0] -> [1 0]
>>> ].iteratedFiniteAutomaton(
>>> 	1,
>>>  	[0 0 0 0],
>>> 	8
>>> )
[
	0 0 0 0;
	1 0 1 0;
	0 1 1 0;
	1 1 1 0;
	0 0 0 1;
	1 0 1 1;
	0 1 1 1;
	1 1 1 1;
	0 0 0 0
]
```

The same rule, iterated for one hundred steps:

~~~spl png=A
[
	[1 1] -> [1 0],
	[1 0] -> [2 1],
	[2 1] -> [2 1],
	[2 0] -> [1 0]
].iteratedFiniteAutomaton(
	1,
 	List(100, 0),
	100
).Bitmap
~~~

![](Help/Image/iteratedFiniteAutomaton-A.png)

Two steps of an automata given an initial centered pattern:

```
>>> [
>>> 	[1 1] -> [2 1],
>>> 	[1 0] -> [2 1],
>>> 	[2 1] -> [3 0],
>>> 	[2 0] -> [1 1],
>>> 	[3 1] -> [1 1],
>>> 	[3 0] -> [3 0]
>>> ].iteratedFiniteAutomaton(
>>> 	1,
>>> 	[1 0 0 1].centerArray(20, 0),
>>> 	2
>>> )
[
	0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0;
	1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0;
	1 0 1 1 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0
]
```

* * *

See also: Dictionary, elementaryCellularAutomaton, substitutionSystem

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/IteratedFiniteAutomaton),
_W_
[1](https://en.wikipedia.org/wiki/Finite-state_transducer)
[2](https://en.wikipedia.org/wiki/Mealy_machine)
