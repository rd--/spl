/* Phase modulation with slow beats (Jmcc) #6 */
{
	let x = MouseX(100, 6000, 1, 0.2); /* random frequency of new events */
	let y = MouseY(0, 2, 0, 0.2); /* modulation index */
	let f1 = Rand(0, x);
	let ph = 0;
	3.timesRepeat {
		let f2 = Rand(0, x);
		ph := SinOsc([f2, f2 + Rand(-1, 1)], 0) * y + ph
	};
	SinOsc([f1, f1 + Rand(-1, 1)], ph) * 0.1
}.overlapTextureProgram(4, 4, 4)
