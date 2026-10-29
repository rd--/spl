# selectT

- _selectT(which, list)_

Select one output from a list of inputs.

All the Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.
Note that the list is fixed at the time of writing the SynthDef, and the whole list is embedded in the SynthDef file itself.
For small lists this is more efficient than reading from a buffer.

- which: integer index (zero indexed)
- list: input list of signals

Cycle though oscillator types:

~~~spl syn=A
let a = [
	sinOsc(440, 0),
	saw(440),
	pulse(440, 0.5)
];
let cycle = a.size * 0.5;
selectT(lfSaw(1, 0) * cycle + cycle, a) * 0.2
~~~

As a sequencer:

~~~spl syn=B
{ :tr |
	{
		let a = { tRand(30, 80, tr) } ! 32;
		let cycle = a.size * 0.5;
		saw(
			selectT(
				lfSaw(1, 0) * cycle + cycle,
				a.midiCps
			)
		) * 0.2
	} ! 2
}.xFadeTexture(3, 4)
~~~

For selecting from a list of constants consider also `bufRd`.

* * *

See also: bufRd, selectX, selectXFocus

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Select.html)

Categories: Ugen
