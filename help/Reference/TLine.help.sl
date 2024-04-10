# TLine

- _TLine(start, end, dur, tr)_

Line generator.
Generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds
- tr: trigger

Random sine sweeps, `TLine` is in linear pitch space:

```
{
	let tr = DustRange(0.5, 1.25);
	let dur = TRand(0.01, 0.5, tr);
	let f0 = TRand(48, 60, tr);
	let f1 = TRand(36, 84, tr);
	let freq = TLine(f0, f1, dur, tr).MidiCps;
	let env = Sine(tr, dur) * 0.1;
	SinOsc(freq, 0) * env
} !^ 7
```

* * *

See also: Line, TxLine

Categories: Ugen
