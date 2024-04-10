# TiRand

- _TiRand(lo, hi, tr)_

Triggered integer random number generator.
Generates a random integer value in uniform distribution from _lo_ to _hi_ each time the _trig_ signal is set.

- lo: Lower limit of the output range
- hi: Upper limit of the output range
- trig: trigger next random number

Random oscillator frequencies:

```
let tr = Dust(10);
SinOsc(TiRand(4, 12, tr) * 100, 0) * 0.1
```

Mouse controls density:

```
let tr = Dust(MouseX(1, 8000, 1, 0.2));
SinOsc(TiRand(4, 12, tr) * 100, 0) * 0.1
```

Random degree, octave and number of harmonics:

```
let scale = [0 2 4 5 7 9 10 12].asLocalBuf;
{ :tr |
	{
		let degree = TiRand(0, 7, tr);
		let octave = TiRand(4, 7, tr);
		let pitchClass = Index(scale, degree);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = TiRand(1, 4, tr);
		Blip(mnn.MidiCps, numHarm) * 0.05
	} !^ 7
}.OverlapTexture(4, 0.05, 2).Mix
```

* * *

See also: IRand, Rand, TRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TIRand.html)

Categories: Ugen
