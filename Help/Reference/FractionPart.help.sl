# FractionPart

- _FractionPart(aNumber)_

Fractional part.
Answer only the fractional part of the signal.

In the program below a phasor in _(0, 1)_ is scaled and the fractional part taken:

```
let mul = MouseX(1, 9, 0, 0.2).RoundTo(1);
let rate = MouseY(1, 9, 0, 0.2) / mul;
let phase = Phasor(
	Impulse(rate, 0),
	rate * SampleDur(),
	0, 1, 0
);
let mnn = [
	phase,
	(phase * mul).FractionPart
] * [12, -12] + [48, 72];
SinOsc(mnn.MidiCps, 0) * 0.1
```

* * *

See also: fractionPart

Categories: Ugen
