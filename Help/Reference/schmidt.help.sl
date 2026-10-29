# schmidt

- _schmidt(in, lo=0, hi=1)_

schmidt trigger.
When _in_ crosses to greater than _hi_, output 1, then when signal crosses lower than _lo_ output 0.
Uses the formula:

> _if(out == 1, { if(in < lo, { out = 0.0 }) }, { if(in > hi, { out = 1.0 }) })_

Output is initially zero.

- in: signal to be tested
- lo: low threshold
- hi: high threshold

Threshold octave jumps:

~~~spl syn=A
let in = lfNoise1(3);
let octave = schmidt(in, -0.15, 0.15) + 1;
sinOsc(in * 200 + 500 * octave, 0) * 0.1
~~~

Misnomer for _Schmitt_.

* * *

See also: trig

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Schmidt.html)
_W_
[1](https://en.wikipedia.org/wiki/Schmitt_trigger)

Categories: Ugen
