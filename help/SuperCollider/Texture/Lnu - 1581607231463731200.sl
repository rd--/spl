(* https://twitter.com/lukiss163/status/1581607231463731200 ; lnu ; requires=SfAcquire *)
{
	var sf = SfAcquireMono('floating_1');
	var n = [-36 -9 -14 0 -19 -5 3 -2 -24 -7];
	var k = n.size;
	var rk = {
		{ LfdNoise3(1 / 86).Abs } ! k
	};
	var w = rk() * Warp1(
		1,
		sf,
		rk(),
		n.MidiRatio,
		rk() * 8 + 8 / 86,
		-1,
		12,
		rk() / 4,
		4
	);
	LeakDc(FreeVerb(w, rk(), rk() + 0.5, rk()), 0.995).Splay2.Tanh
}.overlap(4, 5, 2)
