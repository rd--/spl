(* Ring modulated klank ; Jmcc ; #2 *)
{
	let p = 8; (* number of partials *)
	let i = Dust(20) * 0.02;
	let a = RingzBank(i, { Rand(100, 10000) } ! p, nil, { Rand(0.2, 1) } ! p);
	let o = SinOsc(LfNoise2(1.0 + 0.3.Rand2) * 200 + Rand(350, 400), 0) * a;
	EqPan(o, 1.Rand2)
}.overlap(4, 4, 4)
