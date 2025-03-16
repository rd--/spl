# RandomWalkProcess

- _RandomWalkProcess(p, q)_

A `Type` that represents a random walk with
the probability of a positive unit step _p_,
the probability of a negative unit step _q_,
and the probability of a zero step _1 - p - q_.

Simulate a one-dimensional random walk:

~~~spl svg=A
let p = RandomWalkProcess(0.5, 0.5);
Sfc32(312789)
.randomFunction(p, [0 30 1], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/RandomWalkProcess-A.svg)

For a three-step random walk:

~~~spl svg=B
let p = RandomWalkProcess(0.2, 0.3);
Sfc32(839536)
.randomFunction(p, [0 30 1], 1)
.discretePlot
~~~

![](sw/spl/Help/Image/RandomWalkProcess-B.svg)

* * *

See also: randomFunction, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomWalkProcess.html)
