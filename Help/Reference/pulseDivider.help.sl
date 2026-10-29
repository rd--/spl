# pulseDivider

- _pulseDivider(trig=0, div=2, startCount=0)_

pulse divider.
Outputs one impulse each time it receives a certain number of triggers at its input.

- trig: trigger
- div: number of pulses to divide by.
- startCount: starting value for the trigger count.

The _startCount_ lets one start somewhere in the middle of a count,
or if startCount is negative it adds that many counts to the first time the output is triggers.

Lower tone at quarter the clock rate:

~~~spl syn=A
let p = impulse(8, 0);
let p4 = pulseDivider(p, 4, 0);
[
	sinOsc(1200, 0) * decay2(p, 0.005, 0.1),
	sinOsc(600, 0) * decay2(p4, 0.005, 0.5)
] * 0.4
~~~

Four divisions:

~~~spl syn=B
let p = impulse(8, 0);
let p2 = pulseDivider(p, 2, 1);
let p4 = pulseDivider(p, 4, 0);
let p16 = pulseDivider(p, 16, 0);
[
	sinOsc(1200, 0) * decay2(p, 0.005, 0.1),
	sinOsc(800, 0) * decay2(p2, 0.005, 0.5),
	sinOsc(600, 0) * decay2(p4, 0.005, 0.5),
	sinOsc(200, 0) * decay2(p16, 0.005, 1.0)
].splay * 0.3
~~~

Array expansion:

~~~spl syn=C
impulse(8, 0)
.pulseDivider([3 5], 0)
.perc(0.1, 0.1, -4) * sinOsc(
	[333, 555],
	0
) * 0.1
~~~

* * *

See also: impulse

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PulseDivider.html)

Categories: Ugen
