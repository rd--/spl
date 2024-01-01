(* Gendy1 ; texture *)
{
	EqPan(
		SinOsc(
			Gendy1(
				IRand(0, 6),
				IRand(0, 6),
				SinOsc(0.1, 0) * 0.49 + 0.51,
				SinOsc(0.13, 0) * 0.49 + 0.51,
				Rand(130, 160.3),
				Rand(130, 160.3),
				SinOsc(0.17, 0) * 0.49 + 0.51,
				SinOsc(0.19, 0) * 0.49 + 0.51,
				12,
				12
			) * 200 + 400,
			0
		),
		Rand(-1, 1)
	) * 0.1
} !+ 10

(* Gendy1 ; texture ; mouse control ; requires=keywords ; requires=kr *)
var n = 11;
Resonz(
	{
		var freq = Rand(50, 560.3);
		var numCps = Rand(2, 20);
		var kNum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numCps / 2, numCps / 2);
		var osc = Gendy1(
			ampDist: Rand(0, 6),
			durDist: Rand(0, 6),
			adParam: Rand(0, 1),
			ddParam: Rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: Rand(0, 1),
			durScale: Rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		EqPan2(osc, Rand(-1, 1)) * 0.5 / n.sqrt
	} !+ n,
	MouseX(100, 2000, 0, 0.2),
	MouseY(0.01, 1.0, 0, 0.2)
)

(* ---- Gendy1 ; overlap texture ; requires=eval ; requires=keyword *)
{
	var n = 11;
	{
		var freq = Rand(50, 560.3);
		var numCps = Rand(2, 20);
		var kNum = SinOsc(ExpRand(0.02, 0.2), 0).LinLin(-1, 1, 0, numCps);
		var osc = Gendy1(
			ampDist: Rand(0, 6),
			durDist: Rand(0, 6),
			adParam: Rand(0, 1),
			ddParam: Rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: Rand(0, 1),
			durScale: Rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		EqPan2(osc, Rand(-1, 1)) * 0.1 / n.sqrt
	} !+ n
}.overlap(4, 5, 3)
