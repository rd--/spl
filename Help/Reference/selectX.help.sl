# selectX

- _selectX(which, array)_

mix one output from many sources.
The output is mixed from an array of inputs, performing an equal power crossfade between two adjacent channels.

- which: integer index (zero indexed)
- array: input array of signals

Cycle though oscillator types:

```
let a = [
	sinOsc(440, 0),
	saw(440),
	pulse(440, 0.5)
];
let cycle = a.size * 0.5;
selectX(
	lfSaw(1, 0) * cycle + cycle,
	a
) * 0.2
```

Use mouseX to select frequency modulator:

```
let a = [
	sinOsc(0.25, 0),
	lfSaw(10, 0),
	lfPulse(0.3, 0, 0.5)
].kr;
sinOsc(
	selectX(
		mouseX(0, 1, 0, 0.2) * a.size,
		a
	) * 300 + 400,
	0
) * 0.2
```

* * *

See also: LinSelectX, selectT, selectXFocus

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SelectX.html)

Categories: Ugen
