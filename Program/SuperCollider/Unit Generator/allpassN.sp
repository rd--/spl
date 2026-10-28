/* allpassN ; simple reverb ; https://listarc.cal.bham.ac.uk/lists/sc-users-2005/msg05902.html */
let sinInput = sinOsc(lfNoise2(1).linLin(-1, 1, 333, 555), 0);
let env = lfNoise2(1).abs * 0.1;
let noiseInput = dust(1).decay(0.2) * pinkNoise() / 2;
let decayTime = 1;
let numDelays = 6;
let maxDelayTime = 0.05;
let output = sinInput * env + noiseInput;
numDelays.timesRepeat {
	output := allpassN(
		output,
		maxDelayTime,
		{ rand(0, maxDelayTime) } ! 2,
		decayTime
	)
};
output
