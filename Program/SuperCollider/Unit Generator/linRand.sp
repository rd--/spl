/* linRand */
let minmax = 1;
{
	let freq = linRand(200, 10000, minmax);
	let dur = (1 / freq) * 7500;
	fSinOsc(freq, 0) * line(0.2, 0, dur)
} !^ 15
