# sineFill

- _sineFill(aSequence, amplitudeList, phaseList)_

Fill _aSequence_ with a sum of sines at the indicated amplitudes and phases.
The table is _not_ normalised, see `normalizeSignal`.

Approximation of sawtooth wave:

~~~spl svg=A
let list = List(1024, 0);
list.sineFill(1 / 1:6, [0]);
list.normalizeSignal.linePlot
~~~

![](sw/spl/Help/Image/sineFill-A.svg)

* * *

See also: addSine, normalizeSignal, sineTable

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#*sineFill)

Categories: Wavetable
