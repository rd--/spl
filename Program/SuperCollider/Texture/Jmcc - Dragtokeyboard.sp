/* Dragtokeyboard (Jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ */
{
	let pw = { :u :w |
		lfPulse(expRand(0.1, u), 0, w)
	};
	let in = lfSaw([21000, 21001], 0) * (pw(1, 0.3) * 0.2 + 0.02);
	let sr = expRand(300, 3000) + [-0.6, 0.6];
	rlpf(
		in * lfPulse(sr, 0, mouseY(0.01, 0.99, 0, 0.2)),
		sr * (pw(12, 0.4) * 0.2 + 0.2 + (pw(12, 0.7) * 0.2)),
		0.1
	)
}.overlapTextureProgram(4, 4, 2)
