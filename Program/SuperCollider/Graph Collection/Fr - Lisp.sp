/* Fr https://garten.salat.dev/kabelsalat/lispykabel.html ; Edit */
sequencer([1 2 3] * 100, impulse([4 4.01], [0 0.03]))
.*(sequencer([0.5 1], impulse([1 1.01], [0 0.03])))
.saw
.*(sinOsc(0.2, 0).linLin(-1, 1, 0.1, 0.5))
.rlpf(
	sinOsc([0.5 0.51], 0).linLin(-1, 1, 300, [500 600]),
	sinOsc([0.4 0.41], 0).linLin(-1, 1, 0.4, [0.9 1])
)
.*(impulse(8, 0).perc(0.01, 0.1, -4))
.*(lfSaw(1, 0).linLin(-1, 1, 1, 0).lag(0.1))
