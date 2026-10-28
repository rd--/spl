/* formlet ; impulse */
formlet(impulse(20, 0.5), 1000, 0.01, 0.1)

/* formlet ; blip ; modulate frequency */
formlet(blip(xLine(10, 400, 8), 1000) * 0.2, 1000, 0.01, 0.1)

/* formlet */
formlet(blip(xLine([10, 15], [400, 700], 8), 1000) * 0.2, 1000, 0.01, 0.1)

/* formlet ; mouse control of frequency and decay time */
let f = linExp(lfNoise2([1, 3]), -1, 1, [10, 15], [400, 700]);
let s = blip(f, 1000) * 0.1;
let x = mouseX(0.01, 0.2, 1, 0.2);
let y = mouseY([700, 1300], [2000, 100], 1, 0.2);
formlet(s, y, 0.005, x)

/* formlet ; modulate formant frequency */
formlet(blip(*+(sinOsc(5, 0), 20, 300), 1000) * 0.1, xLine(1500, 700, 8), 0.005, 0.04)

/* formlet ; noise control */
let sig = blip(sinOsc(5, 0) * 20 + 300, 1000) * 0.1;
let frq = linExp(lfNoise2([0.5, 2.5]), -1, 1, [700, 1300], [2000, 100]);
let dcy = linExp(lfNoise2([3, 9]), -1, 1, 0.01, 0.2);
formlet(sig, frq, 0.005, dcy)

/* formlet ; bass percussion */
let tr = impulse(1, 0.5);
formlet(tr, tRand(30, 50, tr), tRand(0.01, 0.2, tr), 2)

/* formlet ; parameters randomised on trigger ; stereo */
let tr = impulse(lfNoise2([0.15, 0.6]) * 15 + 15, 0.5);
formlet(
	tr,
	tRand(30, [150, 600], tr),
	tRand(0.01, [0.15, 0.6], tr),
	tRand(0.05, [0.15, 0.6], tr)
) * 0.25

/* formlet */
let amp = lfPulse(0.5, 0, 0.5);
let my = mouseY(400, 3200, 0, 0.2);
{
	let x = formlet({ dust(12) } ! 2 * 0.05 * amp, my * expRand(0.5, 2), 0.005, 0.1);
	allpassN(x, 0.05, rand(0, 0.05), 8)
} !+ 8
