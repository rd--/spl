/* whiteNoise */
whiteNoise() * 0.05

/* whiteNoise ; silence */
let n = whiteNoise() * 0.05;
n - n

/* whiteNoise ; noise */
let n = whiteNoise () * 0.05;
let m = whiteNoise () * 0.05;
n - m

/* whiteNoise */
let o = sinOsc(mouseY(900, 2300, 1, 0.2), 0);
let n = lag(whiteNoise(), mouseX(0.1, 1, 0, 0.2) * 0.01);
o * n * 0.1
