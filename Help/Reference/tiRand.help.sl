# tiRand

- _tiRand(lo, hi, tr)_

Triggered integer random number generator.
Generates a random integer value in uniform distribution from _lo_ to _hi_ each time the _trig_ signal is set.

- lo: Lower limit of the output range
- hi: Upper limit of the output range
- trig: trigger next random number

Random oscillator frequencies:

~~~spl syn=A
let tr = dust(10);
sinOsc(tiRand(4, 12, tr) * 100, 0) * 0.1
~~~

Mouse controls density:

~~~spl syn=B
let tr = dust(mouseX(1, 8000, 1, 0.2));
sinOsc(tiRand(4, 12, tr) * 100, 0) * 0.1
~~~

Random degree, octave and number of harmonics:

~~~spl syn=C
let scale = [0 2 4 5 7 9 10 12].localBuf;
{ :tr |
	{
		let degree = tiRand(0, 7, tr);
		let octave = tiRand(4, 7, tr);
		let pitchClass = bufIndexClip(scale, degree);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = tiRand(1, 4, tr);
		blip(mnn.midiCps, numHarm) * 0.05
	} !^ 7
}.overlapTexture(4, 0.05, 2).mix
~~~

* * *

See also: iRand, rand, tRand

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TIRand.html)

Categories: Ugen
