/* Repeating inharmonic klank ; Jmcc #6 */
let n = 4;
{
	let s = Decay(Dust(0.8) * 0.004, 3.4) * LfSaw(Rand(0, 40), 0);
	let p = 8;
	{
		RingzBank(
			s,
			{ Rand(80, 10000) } ! p,
			nil,
			{ Rand(0.4, 4.4) } ! p
		)
	} ! 2
}.overlapTextureProgram(8, 8, n)
