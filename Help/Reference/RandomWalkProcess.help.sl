# RandomWalkProcess

- _RandomWalkProcess(p, q)_

A `Type` that represents a random walk with
the probability of a positive unit step _p_,
the probability of a negative unit step _q_,
and the probability of a zero step _1 - p - q_.

Simulate a one-dimensional random walk:

~~~spl svg=A
let r = Sfc32(312789);
RandomWalkProcess(0.5, 0.5)
.randomFunction(r, [0 30], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/RandomWalkProcess-A.svg)

For a three-step random walk:

~~~spl svg=B
let r = Sfc32(839536);
RandomWalkProcess(0.2, 0.3)
.randomFunction(r, [0 30], 1)
.stepPlot
~~~

![](sw/spl/Help/Image/RandomWalkProcess-B.svg)

Simulate an ensemble of random paths:

~~~spl svg=C
let r = Sfc32(673814);
RandomWalkProcess(0.7, 0.3)
.randomFunction(r, [0 25], 4)
.stepPlot
~~~

![](sw/spl/Help/Image/RandomWalkProcess-C.svg)

A symmetric random walk in two-dimensions:

~~~spl svg=D
let r = Sfc32(768134);
RandomWalkProcess(0.5, 0.5)
.randomFunction(r, [0 1E3], 2)
.valueList
.transposed
.Line
.asLineDrawing
~~~

![](sw/spl/Help/Image/RandomWalkProcess-D.svg)

A symmetric random walk in three-dimensions:

~~~spl svg=E
let r = Sfc32(791234);
RandomWalkProcess(0.5, 0.5)
.randomFunction(r, [0 1E3], 3)
.valueList
.transposed
.Line
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/RandomWalkProcess-E.svg)

* * *

See also: BernoulliProcess, randomFunction, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomWalkProcess.html)
