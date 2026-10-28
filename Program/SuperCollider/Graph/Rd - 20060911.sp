/* 20060911 ; rd */
let x = mouseX(0.03, 0.12, 1, 0.1);
let y = mouseY(0.01, 0.52, 1, 0.1) * 0.4;
let z = {
	let t = [
		sinOsc(rand(0.3, 0.5), rand(0, 1.pi)) + 1,
		impulse(lfNoise2(1 / 3) * 11 + 11, 0),
		0.5
	].product;
	ringz(
		coinGate(
			[0.05, lfNoise0(2), y, t].sum.lpz2,
			t
		),
		tExpRand([500 900], 1600, t),
		x
	)
} !> 3;
z.bilateralClip(
	tRand(0, 1, dust(8))
) * 0.25
