/* Lots-o-sins (Jmcc) #2 */
{
	let n = 60;
	{
		sinOscBank(
			{ 40 + linRand(0, 10000, 0) } ! n,
			nil,
			nil
		)
	} ! 2 * (0.1 / n)
}.overlapTextureProgram(4, 4, 2)
