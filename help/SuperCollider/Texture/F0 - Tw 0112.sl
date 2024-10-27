/* https://sccode.org/1-4Qy ; F0 ; 0112 */
1:37.collectTexture { :i |
	{
		let lvl = Dseq(1, 12:0 * (i % 63 + 99));
		let freq = Duty(1 / 12, 0, lvl) * [1, 1.01];
		let saw = VarSaw(freq, 0, i / 9 % 9 / 9) / 9;
		Release(saw, 0.02, 1, 0.02)
	} !+ 2
} { 1 / 3 }
