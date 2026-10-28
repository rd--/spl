/* saw ; amplitude modulation */
saw(440) * sinOsc(mouseX(1, 880, 1, 0.2), 0) / 5

/* saw ; https://sccode.org/1-4Qy ; f0 ; 0287 */
let c = ':>AEH.'.ascii;
let m = c - (2 ^ lfSaw([1 .. 5] / 32, 0)).ceiling;
let o = saw(m.midiCps);
o.splay / 2

/* saw ; Method chaining notation */
saw(
	sinOsc(0.2, 0)
	.linLin(-1, 1, [200 300 400], [600 700 800])
	.latch(impulse([2 6], 0))
).sum.*(
	impulse([2 3], 0)
	.perc(0.01, 0.04, -4)
	.lag(10)
).lpf(
	sinOsc(0.1, 0)
	.linLin(-1, 1, 500, 700)
)
