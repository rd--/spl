# TiRand -- triggered integer random number generator

_TiRand(lo, hi, tr)_

Generates a random integer value in uniform distribution from _lo_ to _hi_ each time the _trig_ signal changes from nonpositive to positive values.

- lo: Lower limit of the output range
- hi: Upper limit of the output range
- trig: A trigger occurs when this signal changes from non-positive to positive

Random oscillator frequencies:

	var tr = Dust(10);
	SinOsc(TiRand(4, 12, tr) * 100, 0) * 0.1

Mouse controls density:

	var tr = Dust(MouseX(1, 8000, 1, 0.2));
	SinOsc(TiRand(4, 12, tr) * 100, 0) * 0.1

Random degree, octave and number of harmonics:

	var scale = [0 2 4 5 7 9 10 12].asLocalBuf;
	{ :tr |
		{
			var degree = TiRand(0, 7, tr);
			var octave = TiRand(4, 7, tr);
			var pitchClass = Index(scale, degree);
			var mnn = (octave * 12) + pitchClass;
			var numHarm = TiRand(1, 4, tr);
			Blip(mnn.MidiCps, numHarm) * 0.05
		} !^ 7
	}.OverlapTexture(4, 0.05, 2).Mix

* * *

See also: IRand, Rand, TRand
