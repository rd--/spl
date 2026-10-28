/* mix ; rule based mixing ; system preference */
let n = 9;
{ :tr |
	let ping = sinOsc(2222, 0) * decay2(tr, 0.01, 0.2);
	let sine = sinOsc(tRand(22, 333, tr), 0);
	eqPan2(
		[ping, sine],
		[-1, tRand(-1, 1, tr)]
	).sum * [0.1, 0.05]
}.overlapTexture(n, 0, n).mix

/* mix ; !> is ! then mix */
{
	eqPan2(
		sinOsc(rand(22, 333), 0),
		rand(-1, 1)
	) * rand(0.01, 0.05)
} !> 9

/* mix ; simple '2×2→1×4' rule */
{
	sinOsc(
		{ rand(111, 333) } ! 2,
		0
	) / rand(7, 23)
} !> 2
