# addSine

- _addSine(aSequence, harmonicNumber, amplitude, initialPhase, offset)_

Add a sine component to a mutable sequence.

Approximation of square wave:

~~~spl svg=A
let list = List(1024, 0);
list.addSine(1, 3, 0, 0);
list.addSine(3, 1, 0, 0);
list.addSine(9, 1 / 3, 1.pi, 0);
list.linePlot
~~~

![](sw/spl/Help/Image/addSine-A.svg)

* * *

See also: sineFill

Categories: Wavetable
