# Select

- _Select(which, list)_

Select output from a list of inputs.

All the Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.
Note that the list is fixed at the time of writing the SynthDef, and the whole list is embedded in the SynthDef file itself.
For small lists this is more efficient than reading from a buffer.

- which: integer index (zero indexed)
- list: input list of signals

Cycle though oscillator types:

```
let a = [
	SinOsc(440, 0),
	Saw(440),
	Pulse(440, 0.5)
];
let cycle = a.size * 0.5;
Select(LfSaw(1, 0) * cycle + cycle, a) * 0.2
```

As a sequencer:

```
{ :tr |
	{
		let a = { TRand(30, 80, tr) } ! 32;
		let cycle = a.size * 0.5;
		Saw(
			Select(
				LfSaw(1, 0) * cycle + cycle,
				a.MidiCps
			)
		) * 0.2
	} ! 2
}.XFadeTexture(3, 4)
```

For selecting from a list of constants consider also `BufRd`.

* * *

See also: BufRd, SelectX, SelectXFocus, LinSelectX

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Select.html)

Categories: Ugen
