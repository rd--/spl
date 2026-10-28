/* Deep Trip (Jmcc) #9 */
{
	let f = (lfNoise1(rand(0, 0.3)) * 60 + 70).midiCps;
	let a = lfNoise2(f * rand(0, 0.5));
	let b = [
		lfNoise1(rand(0, 8)),
		sinOsc(rand(0, 40), 0),
		0.1
	].product.max(0);
	let s = eqPan(sinOsc(f, 0) * a * b, lfNoise1(rand(0, 5)));
	let c = {
		combN(s, 0.5, { rand(0.2, 0.5) } ! 2, 20)
	} ! 2;
	s + c.sum
}.overlapTextureProgram(12, 4, 4)
