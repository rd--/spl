/* sine ; fixed duration envelope generator ; resets on trigger */
sinOsc(220, 0) * sine(impulse(0.5, 0), 1.5) * 0.1

/* sine ; envelope generator ; random duration, frequency & amplitude */
let tr = impulse(1, 0);
let freq = tRand(220, 330, tr);
let dur = tRand(0.05, 0.95, tr);
let amp = tRand(0.01, 0.2, tr);
sinOsc(freq, 0) * sine(tr, dur) * amp

/* sine ; mouse control */
let f = mouseX(0.25, 8, 0, 0.2);
let a = mouseY(0.05, 0.1, 0, 0.2);
let tr = impulse(f, 0);
sinOsc(tRand(220, 440, tr), 0) * sine(tr, 1 / f) * a

/* sine ; texture */
{ :tr |
	let freq = { tiRand(5, 23, tr) } ! 2 * 17;
	let dur = { tiRand(3, 7, tr) } ! 2;
	sinOsc(freq, 0) * sine(tr, dur) / 7
}.overlapTexture(3, 5, 8).mix
