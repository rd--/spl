# sineFill

- _sineFill(aSequence, amplitudeList, phaseList)_

Fill _aSequence_ with a sum of sines at the indicated amplitudes and phases.
The table is _not_ normalised, see `normalizeSignal`.

Approximation of sawtooth wave:

~~~
let list = List(1024, 0);
list.sineFill(1 / 1:6, [0]);
list.normalizeSignal.linePlot
~~~

* * *

See also: addSine, normalizeSignal, sineTable

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Signal.html#*sineFill)

Categories: Wavetable
