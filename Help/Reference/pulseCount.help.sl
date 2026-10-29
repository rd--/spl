# pulseCount

- _pulseCount(trig=0, reset=0)_

pulse counter.
Each trigger increments a counter which is output as a signal.

- trig: trigger
- reset: resets the counter to zero when triggered.

pulse count as frequency input:

~~~spl syn=A
let count = pulseCount(
	impulse(10, 0),
	impulse(0.4, 0)
);
sinOsc(count * 200, 0) * 0.05
~~~

* * *

See also: impulse, pulseDivider, stepper

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PulseCount.html)

Categories: Ugen
