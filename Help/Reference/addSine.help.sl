# addSine

- _addSine([x₁ x₂ …], h, a, ϕ, i)_

Add a sine component to the mutable sequence _x_.
The parameters are harmonic number _h_,
amplitude _a_,
initial phase _ϕ_,
and initial index offset _i_.

Plot approximation of square wave:

~~~spl svg=A
let x = List(1024, 0);
x.addSine(1, 3, 0, 0);
x.addSine(3, 1, 0, 0);
x.addSine(9, 1 / 3, 1.pi, 0);
x.linePlot
~~~

![](sw/spl/Help/Image/addSine-A.svg)

* * *

See also: sin, sineFill, sineTable

Guides: Signal Processing Functions

Categories: Wavetable
