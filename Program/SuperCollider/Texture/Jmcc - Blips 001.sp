/* Blips 001 (Jmcc) #SC3d1.5 */
let blipProc = {
	Blip(
		XLine(ExpRand(0.25, 400), ExpRand(0.25, 400), 4),
		XLine(ExpRand(2, 100), ExpRand(2, 100), 4)
	)
};
{
	if(system.coin(0.8)) {
		let z = EqPan(
			blipProc() * blipProc(),
			Line(Rand(-1, 1), Rand(-1, 1), 4)
		).Distort * 0.3;
		6.timesRepeat {
			z := AllpassN(z, 0.05, { Rand(0, 0.05) } ! 2, 4)
		};
		z
	} {
		Silent(2)
	}
}.overlapTextureProgram(2, 1, 12)
