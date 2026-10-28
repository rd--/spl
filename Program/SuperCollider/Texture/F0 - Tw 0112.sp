/* https://sccode.org/1-4Qy ; F0 ; 0112 */
[1 .. 37].collectTextureProgram { :i |
	{
		let lvl = dseq(1, [12 .. 0; -1] * (i % 63 + 99));
		let freq = duty(1 / 12, 0, lvl) * [1 1.01];
		let saw = varSaw(freq, 0, i / 9 % 9 / 9) / 9;
		release(saw, 0.02, 1, 0.02)
	} !+ 2
} { 1 / 3 }
