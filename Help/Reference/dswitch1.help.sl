# dswitch1

- _dswitch1(index, list)_

Demand rate generator for switching between inputs.

- index: Which of the inputs to return.
- list: List of values.

`mouseX` selects input:

~~~spl syn=A
let a = dswitch1(
	mouseX(0, 4, 0, 0.2),
	[
		1,
		3,
		mouseY(1, 15, 0, 0.2),
		2,
		dwhite(Infinity, 0, 3)
	]
);
let trig = impulse(3, 0);
let freq = demand(trig, 0, a) * 30 + 340;
sinOsc(freq, 0) * 0.1
~~~

Inputs are of increasing number of steps:

~~~spl syn=B
let a = dswitch1(
	mouseX(0, 4, 0, 0.2),
	0:4.collect { :i |
		dseq(Infinity, [0 .. i * 3])
	}
);
let trig = impulse(6, 0);
let freq = demand(trig, 0, a) * 30 + 340;
sinOsc(freq, 0) * 0.1
~~~

* * *

See also: demand, dswitch, duty, tDuty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dswitch1.html)
