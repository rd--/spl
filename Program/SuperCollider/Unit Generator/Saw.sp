/* Saw ; amplitude modulation */
Saw(440) * SinOsc(MouseX(1, 880, 1, 0.2), 0) / 5

/* Saw ; https://sccode.org/1-4Qy ; f0 ; 0287 */
let c = ':>AEH.'.ascii;
let m = c - (2 ^ LfSaw([1 .. 5] / 32, 0)).ceiling;
let o = Saw(m.midiCps);
o.Splay / 2

/* Saw ; Method chaining notation */
Saw(
	SinOsc(0.2, 0)
	.linLin(-1, 1, [200 300 400], [600 700 800])
	.Latch(Impulse([2 6], 0))
).sum.*(
	Impulse([2 3], 0)
	.Perc(0.01, 0.04, -4)
	.Lag(10)
).Lpf(
	SinOsc(0.1, 0)
	.linLin(-1, 1, 500, 700)
)
