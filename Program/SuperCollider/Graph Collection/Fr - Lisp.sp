/* Fr https://garten.salat.dev/kabelsalat/lispykabel.html ; Edit */
Sequencer([1 2 3] * 100, Impulse([4 4.01], [0 0.03]))
.Times(Sequencer([0.5 1], Impulse([1 1.01], [0 0.03])))
.Saw
.Times(SinOsc(0.2, 0).LinLin(-1, 1, 0.1, 0.5))
.Rlpf(
	SinOsc([0.5 0.51], 0).LinLin(-1, 1, 300, [500 600]),
	SinOsc([0.4 0.41], 0).LinLin(-1, 1, 0.4, [0.9 1])
)
.Times(Impulse(8, 0).Perc(0.01, 0.1, -4))
.Times(LfSaw(1, 0).LinLin(-1, 1, 1, 0).Lag(0.1))
