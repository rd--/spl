# tDuty

- _tDuty(dur=1, reset=0, level=1)_

Demand results as trigger from demand rate unit generators.

A value is demanded of each unit generator in the list and output as a trigger,
according to a stream of duration values.
The unit generators in the list should be _demand_ rate.

When there is a trigger at the reset input,
the demand rate unit generators in the list and the duration are reset.

- dur: time values, the next level is acquired after duration
- reset: resets the list of unit generators and the duration unit generator when triggered
- level: demand unit generator providing the output values

The reset input may also be a demand unit generator, providing a stream of reset times.

A demand unit generator as durations:

~~~spl syn=A
let trig = tDuty(
	drand(Infinity, [0.01 0.2 0.4 0.3]),
	0,
	dseq(Infinity, [0.1 0.4 0.01 0.1 1])
);
ringz(trig, 1000, 1) * 0.1
~~~

Control rate ugen as durations:

~~~spl syn=B
let trig = tDuty(
	mouseX(0.1, 0.5, 1, 0.2),
	0,
	dseq(Infinity, [0.1 0.4 0.01 0.1 1])
);
ringz(trig, 1000, 1) * 0.1
~~~

Duration sequence:

~~~spl syn=C
let b = [3 3 2 2 2 1 2 2 2] / 3;
tDuty(dseq(Infinity, b), 0, 1)
~~~

* * *

See also: demand, duty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TDuty.html)
