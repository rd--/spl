/* tiRand */
let scale = [0 2 4 5 7 9 10 12].localBuf;
{ :tr |
	{
		let degree = tiRand(0, 7, tr);
		let octave = tiRand(4, 7, tr);
		let pitchClass = bufIndexClip(scale, degree);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = tiRand(1, 4, tr);
		blip(mnn.midiCps, numHarm) * 0.1
	} ! 7
}.overlapTexture(4, 0.05, 2).mix
