# tLine

- _tLine(start, end, dur, tr)_

Line generator.
Generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds
- tr: trigger

Random sine sweeps, `tLine` is in linear pitch space:

~~~spl syn=A
{
	let tr = dustRange(0.5, 1.25);
	let dur = tRand(0.01, 0.5, tr);
	let f0 = tRand(48, 60, tr);
	let f1 = tRand(36, 84, tr);
	let freq = tLine(f0, f1, dur, tr).midiCps;
	let env = sine(tr, dur) * 0.1;
	sinOsc(freq, 0) * env
} !^ 7
~~~

* * *

See also: Line, txLine

Guides: Unit Generators

Categories: Ugen
