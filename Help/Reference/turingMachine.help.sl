# turingMachine

- _turingMachine(r, [s₀, [a₁ a₂ …; b₁ b₂ …], t)_

Answer a list representing the evolution of the Turing machine,
with the specified rule _r_,
from initial condition _s₀,a,b_ for _t_ steps.
Where _s₀_ is the initial state,
_a_ is the initial non-background tape cells,
and _b_ is the background tape cell pattern.
_a_ is ordinarily empty and _b_ is ordinarily the unit list _[0]_.

A two-state, two-color machine with an infinite tape of zeroes,
and initial state one,
evolving for four steps:

```
>>> 2506.turingMachineFromNumber(2, 2)
>>> .turingMachine([1, [; 0]], 4)
[
	1 3  0; 0 0 0 0:;
	2 4  1; 0 0 1 0:;
	1 3  0; 0 0 1 1:;
	2 2 -1; 0 0 0 1:;
	1 1 -2; 0 1 0 1
]
```

With initial state of two:

```
>>> 2506.turingMachineFromNumber(2, 2)
>>> .turingMachine([2, [; 0]], 4)
[
	2 2  0; 0 0 0 0:;
	1 1 -1; 0 1 0 0:;
	2 2  0; 1 1 0 0:;
	1 3  1; 1 0 0 0:;
	2 4  2; 1 0 1 0
]
```

~~~spl svg=A
2506.turingMachineFromNumber(2, 2)
.turingMachine([1, [; 0]], 30)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-A.svg)

A three-state, two-color machine:

~~~spl svg=B
2139050.turingMachineFromNumber(3, 2)
.turingMachine([1, [; 0]], 30)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-B.svg)

~~~spl svg=C
596440.turingMachineFromNumber(2, 3)
.turingMachine([1, [; 0]], 80)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-C.svg)

A sequence of two-state, two-color machines:

~~~spl svg=D
[2500, 2502 .. 2510].collect { :n |
	n.turingMachineFromNumber(2, 2)
	.turingMachine([1, [; 0]], 30)
	.collect(last:/1)
	.matrixPlot
}.PlotSet([2 3])
~~~

![](Help/Image/turingMachine-D.svg)

Start with the block _2,1,1_ on a background of zeroes:

~~~spl svg=E
596440.turingMachineFromNumber(2, 3)
.turingMachine([1, [2 1 1; 0]], 10)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-E.svg)

Start with the block _2,1,1_ on a background of repeated _0,2_ blocks:

~~~spl svg=F
596440.turingMachineFromNumber(2, 3)
.turingMachine([1, [2 1 1; 0 2]], 10)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-F.svg)

Start with a tape of _1_ on an infinite background of zeroes:

~~~spl svg=G
956440.turingMachineFromNumber(3, 2)
.turingMachine([1, [1; 0]], 20)
.collect(last:/1)
.matrixPlot
~~~

![](Help/Image/turingMachine-G.svg)

Plot location of read head relative to initial position:

~~~spl svg=H
2506.turingMachineFromNumber(2, 2)
.turingMachine([1, [; 0]], 30)
.collect { :c |
	c[1][3]
}.stepPlot
~~~

![](Help/Image/turingMachine-H.svg)

* * *

See also: turingMachineFromNumber

Guides: Automata Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TuringMachine.html),
_W_
[1](https://en.wikipedia.org/wiki/Turing_machine)
