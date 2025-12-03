# sineFill

- _sineFill([x₁ x₂ …], [a₁ a₂ …], [ϕ₁ ϕ₂ …])_

Fill the sequence _x_ with the sum of the sine function of succesive harmonics at amplitudes _a_ and phases _ϕ_.
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
