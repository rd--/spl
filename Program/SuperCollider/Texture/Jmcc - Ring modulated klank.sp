/* Ring modulated klank ; Jmcc ; #2 */
{
	let p = 8; /* number of partials */
	let i = dust(20) * 0.02;
	let a = ringzBank(i, { rand(100, 10000) } ! p, nil, { rand(0.2, 1) } ! p);
	let o = sinOsc(lfNoise2(1.0 + rand(-0.3, 0.3)) * 200 + rand(350, 400), 0) * a;
	eqPan(o, rand(-1, 1))
}.overlapTextureProgram(4, 4, 4)
