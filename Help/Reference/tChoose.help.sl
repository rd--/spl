# tChoose

- _tChoose(trig, list)_

Randomly select one of several inputs.
An output is selected randomly on receiving a trigger from a list of inputs.

tChoose is defined in terms of `Select` and `tiRand`.

- trig: select new input
- list: list of inputs

Cycle though oscillator types, mouse control of trigger density:

~~~spl syn=A
let a = [
	sinOsc(440, 0),
	saw(440),
	pulse(440, 0.5)
];
tChoose(
	dust(
		mouseX(1, 1000, 1, 0.2)
	),
	a
) * 0.2
~~~

At control rate can select from a constant array:

~~~
splay(
	sinOsc(
		tChoose(
			dust([3 5 7]),
			55 * [1 .. 17]
		).kr,
		0
	)
) * 0.1
~~~

Note:
All Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.

* * *

See also: Select

Guides: Unit Generators

Categories: Ugen
