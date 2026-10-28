/* https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1 */
{
	let n = 5 + [1 .. 9].atRandom;
	let x = mouseX(100, 2000, 0, 0.2);
	let y = mouseY(0.01, 1.0, 0, 0.2);
	let o = {
		let freq = rand(50, 560.3);
		let numCps = rand(2, 20);
		let kNum = sinOsc(expRand(0.02, 0.2), 0) * (numCps / 2) + (numCps / 2);
		let gen = gendy1(
			iRand(0, 6),
			iRand(0, 6),
			rand(0, 1),
			rand(0, 1),
			freq,
			freq,
			rand(0, 1),
			rand(0, 1),
			numCps,
			kNum
		);
		eqPan(gen, rand(-1, 1)) * 0.5 / n.sqrt
	} !+ n;
	resonz(o, x, y) * 0.5
}.overlapTextureProgram(5, 4, 3)
