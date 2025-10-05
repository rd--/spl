# addSine

- _addSine([x₁ x₂ …], harmonicNumber, amplitude, initialPhase, offset)_

Add a sine component to the mutable sequence _x_.

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

See also: sineFill

Guides: Signal Processing Functions

Categories: Wavetable
