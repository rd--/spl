# TiRand -- triggered integer random number generator

_TiRand(lo, hi, tr)_

Generates a random integer value in uniform distribution from lo to hi each time the trig signal changes from nonpositive to positive values.
Usually written as _IRand(tr,lo,hi)_.

	var tr = Dust(10);
	SinOsc(IRand(tr, 4, 12) * 100, 0) * 0.1

Mouse controls density:

	var tr = Dust(MouseX(1, 8000, 1, 0.2));
	SinOsc(IRand(tr, 4, 12) * 100, 0) * 0.1

Random degree, octave and number of harmonics:

	var scale = [0, 2, 4, 5, 7, 9, 10, 12].asLocalBuf;
	{ :tr |
		{
			var degree = IRand(tr, 0, 7);
			var octave = IRand(tr, 4, 7);
			var pitchClass = Index(scale, degree);
			var mnn = (octave * 12) + pitchClass;
			var numHarm = IRand(tr, 1, 4);
			Blip(mnn.MidiCps, numHarm) * 0.05
		} !^ 7
	}.OverlapTexture(4, 0.05, 2)

* * *

See also: IRand, Rand, TRand
