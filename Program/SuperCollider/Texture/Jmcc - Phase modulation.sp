/* Phase modulation with slow beats (Jmcc) #6 */
{
	let x = mouseX(100, 6000, 1, 0.2); /* random frequency of new events */
	let y = mouseY(0, 2, 0, 0.2); /* modulation index */
	let f1 = rand(0, x);
	let ph = 0;
	3.timesRepeat {
		let f2 = rand(0, x);
		ph := sinOsc([f2, f2 + rand(-1, 1)], 0) * y + ph
	};
	sinOsc([f1, f1 + rand(-1, 1)], ph) * 0.1
}.overlapTextureProgram(4, 4, 4)
