/* Repeating inharmonic klank ; Jmcc #6 */
let n = 4;
{
	let s = decay(dust(0.8) * 0.004, 3.4) * lfSaw(rand(0, 40), 0);
	let p = 8;
	{
		ringzBank(
			s,
			{ rand(80, 10000) } ! p,
			nil,
			{ rand(0.4, 4.4) } ! p
		)
	} ! 2
}.overlapTextureProgram(8, 8, n)
