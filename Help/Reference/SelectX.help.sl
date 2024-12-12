# SelectX

- _SelectX(which, array)_

Mix one output from many sources.
The output is mixed from an array of inputs, performing an equal power crossfade between two adjacent channels.

- which: integer index (zero indexed)
- array: input array of signals

Cycle though oscillator types:

```
let a = [
	SinOsc(440, 0),
	Saw(440),
	Pulse(440, 0.5)
];
let cycle = a.size * 0.5;
SelectX(
	LfSaw(1, 0) * cycle + cycle,
	a
) * 0.2
```

Use MouseX to select frequency modulator:

```
let a = [
	SinOsc(0.25, 0),
	LfSaw(10, 0),
	LfPulse(0.3, 0, 0.5)
].kr;
SinOsc(
	SelectX(
		MouseX(0, 1, 0, 0.2) * a.size,
		a
	) * 300 + 400,
	0
) * 0.2
```

* * *

See also: Select, SelectXFocus, LinSelectX

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SelectX.html)

Categories: Ugen
