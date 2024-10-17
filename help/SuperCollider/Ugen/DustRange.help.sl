/* DustRange ; a = noise, b = impulses */
let a = DustRange(0.0001, 0.001) * 0.1;
let b = DustRange(0.1, 0.1) * 0.5;
[a, b]

/* DustRange ; audio rate impulse train of varying amplitude (min = max) */
[
	DustRange(0.1, 0.1),
	Impulse(10, 0)
] * 0.1

/* DustRange ; mean iot=0.0005 is equivalent to density=2000 at dust, dustRange spacing is more uniform */
[
	DustRange(0.0001, 0.001) * 0.1,
	Dust(2000) * 0.05
]

/* DustRange ; velvet noise (approx.) */
let iot = 20 / SampleRate();
let x = MouseX(1, 16, 1, 0.1);
let d = DustRange(iot / x, iot * x);
let s = TRand(-1, 1, d);
Trig(d, SampleDur()) * s.Sign * 0.1

/* DustRange ; sine sweeps */
{
	let tr = DustRange(0.5, 1.25);
	let dur = TRand(0.01, 0.5, tr);
	let f0 = TRand(48, 60, tr);
	let f1 = TRand(36, 84, tr);
	let freq = TLine(f0, f1, dur, tr).MidiCps;
	let env = Decay2(tr, dur / 3, dur) * 0.5;
	SinOsc(freq, 0) * env
} !^ 7

/* ---- notes.md ----

	Inter-offset times generated randomly in range (seconds) with uniform distribution.

-}
