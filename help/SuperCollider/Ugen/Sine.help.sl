(* Sine ; fixed duration envelope generator ; resets on trigger *)
SinOsc(220, 0) * Sine(Impulse(0.5, 0), 1.5) * 0.1

(* Sine ; envelope generator ; random duration, frequency & amplitude *)
let tr = Impulse(1, 0);
let freq = TRand(220, 330, tr);
let dur = TRand(0.05, 0.95, tr);
let amp = TRand(0.01, 0.2, tr);
SinOsc(freq, 0) * Sine(tr, dur) * amp

(* Sine ; mouse control *)
let f = MouseX(0.25, 8, 0, 0.2);
let a = MouseY(0.05, 0.1, 0, 0.2);
let tr = Impulse(f, 0);
SinOsc(TRand(220, 440, tr), 0) * Sine(tr, 1 / f) * a

(* Sine ; texture *)
{ :tr |
	let freq = { TiRand(5, 23, tr) } ! 2 * 17;
	let dur = { TiRand(3, 7, tr) } ! 2;
	SinOsc(freq, 0) * Sine(tr, dur) / 7
}.OverlapTexture(3, 5, 8).Mix
