# sineFill

- _sineFill([x₁ x₂ …], amplitudeList, phaseList)_

Fill the sequence _x_ with a sum of sines at the indicated amplitudes and phases.
The table is _not_ normalised, see `normalizeSignal`.

Plot approximation of sawtooth wave:

~~~spl svg=A
let x = List(1024, 0);
x.sineFill(1 / 1:6, [0]);
x.normalizeSignal.linePlot
~~~

![](sw/spl/Help/Image/sineFill-A.svg)

* * *

See also: addSine, normalizeSignal, sineTable

Guides: Signal Processing Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#*sineFill)

Categories: Wavetable
