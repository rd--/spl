/* https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1 */
{
	let n = 5 + 9.atRandom;
	let x = MouseX(100, 2000, 0, 0.2);
	let y = MouseY(0.01, 1.0, 0, 0.2);
	let o = {
		let freq = Rand(50, 560.3);
		let numCps = Rand(2, 20);
		let kNum = SinOsc(ExpRand(0.02, 0.2), 0) * (numCps / 2) + (numCps / 2);
		let gen = Gendy1(
			IRand(0, 6),
			IRand(0, 6),
			Rand(0, 1),
			Rand(0, 1),
			freq,
			freq,
			Rand(0, 1),
			Rand(0, 1),
			numCps,
			kNum
		);
		EqPan(gen, Rand(-1, 1)) * 0.5 / n.sqrt
	} !+ n;
	Resonz(o, x, y) * 0.5
}.overlapTextureProgram(5, 4, 3)
