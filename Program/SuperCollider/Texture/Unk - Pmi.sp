/* Unknown ; Pmi */
{
	let pm = line(0, rand(0, 12), rand(1, 12));
	eqPan(
		pmOsc(rand(0, 2000), rand(0, 800), pm, 0),
		rand(-1, 1)
	) * 0.05
}.overlapTextureProgram(1, 2, 7)
