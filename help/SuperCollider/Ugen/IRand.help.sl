{- IRand -}
let scale = [0, 2, 4, 5, 7, 9, 10, 12].asLocalBuf;
{
	let degree = IRand(0, 7);
	let octave = IRand(4, 7);
	let pitchClass = Index(scale, degree);
	let mnn = (octave * 12) + pitchClass;
	let numHarm = IRand(1, 4);
	Blip(mnn.MidiCps, numHarm) * 0.1
} !^ 7

{- ---- IRand ; scheduled texture ; requies=eval -}
let scale = [0, 2, 4, 5, 7, 9, 10, 12].asLocalBuf;
{
	{
		let degree = IRand(0, 7);
		let octave = IRand(3, 5);
		let pitchClass = Index(scale, degree);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = IRand(1, 4);
		Blip(mnn.MidiCps, numHarm) * Rand(0.01, 0.1)
	} !^ 3:7.atRandom
}.overlap(3, 3, 3)
