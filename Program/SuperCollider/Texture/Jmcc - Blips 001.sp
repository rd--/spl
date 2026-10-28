/* Blips 001 (Jmcc) #SC3d1.5 */
let blipProc = {
	blip(
		xLine(expRand(0.25, 400), expRand(0.25, 400), 4),
		xLine(expRand(2, 100), expRand(2, 100), 4)
	)
};
{
	if(system.coin(0.8)) {
		let z = eqPan(
			blipProc() * blipProc(),
			line(rand(-1, 1), rand(-1, 1), 4)
		).distort * 0.3;
		6.timesRepeat {
			z := allpassN(z, 0.05, { rand(0, 0.05) } ! 2, 4)
		};
		z
	} {
		silent(2)
	}
}.overlapTextureProgram(2, 1, 12)
