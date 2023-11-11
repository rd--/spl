# Line -- line generator

_Line(tr, start, end, dur)_
_Line(start, end, dur)_ == _Line(1, start, end, dur)_

Generates a line from the start value to the end value.

- tr: trigger
- start: starting value
- end: ending value
- dur: duration in seconds

Random sine sweeps, line is in linear pitch space:

{
	var tr = DustRange(0.5, 1.25);
	var dur = Rand(tr, 0.01, 0.5);
	var f0 = Rand(tr, 48, 60);
	var f1 = Rand(tr, 36, 84);
	var freq = Line(tr, f0, f1, dur).MidiCps;
	var env = Sine(tr, dur) * 0.1;
	SinOsc(freq, 0) * env
} !^ 7

XLine is usually better than Line for frequency:

	SinOsc(Line(200, 17000, 10), 0) * 0.1

_Note_: This is the Sc _Line_ Ugen without the _doneAction_ input.

* * *

See also: XLine
