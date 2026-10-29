# iRand

- _iRand(lo=0, hi=127)_

Random number generator.
Generates a single random integer value in uniform distribution from _lo_ to _hi_.

~~~spl syn=A
let scale = [0 2 4 5 7 9 10 12].localBuf;
{
	let degree = iRand(0, 7);
	let octave = iRand(4, 7);
	let pitchClass = bufIndexClip(scale, degree);
	let mnn = (octave * 12) + pitchClass;
	let numHarm = iRand(1, 4);
	blip(mnn.midiCps, numHarm) * 0.1
} !^ 7
~~~

Scheduled texture program:

~~~spl texture
let scale = [0 2 4 5 7 9 10 12].localBuf;
{
	{
		let scaleDegree = iRand(0, 7);
		let octave = iRand(3, 5);
		let pitchClass = bufIndexClip(
			scale,
			scaleDegree
		);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = iRand(1, 4);
		blip(
			mnn.midiCps,
			numHarm
		) * rand(0.01, 0.1)
	} !^ 3:7.atRandom
}.overlapTextureProgram(3, 3, 3)
~~~

* * *

See also: rand, tiRand

Guides: Unit Generators

Categories: Random
