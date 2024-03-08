# addSine

- _addSine(aSequence, harmonicNumber, amplitude, initialPhase)_

Add a sine component to a mutable sequence.

Approximation of square wave:

~~~
let list = List(1024, 0);
list.addSine(1, 3, 0);
list.addSine(3, 1, 0);
list.addSine(9, 1 / 3, pi);
list.plot
~~~

* * *

See also: sineFill
