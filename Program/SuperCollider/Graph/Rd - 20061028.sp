/* 20061028 ; rd */
let x = mouseX(20, 22000, 0, [0.005, 0.025]);
let y = mouseY(20, 22000, 0, [0.005, 0.075]);
{
	let a = sinOsc(x + lfNoise0([5, 9]), 0);
	let b = sinOsc(y, 0);
	a * b
} !+ 3 * 0.35
