/* https://anticapitalist.party/@ahihi/113238943073232286 */
let withDelayed = { :in :delayTime :feedbackMultiplier |
	FeedforwardFeedbackward(in, +) { :x |
		DelayN(x, delayTime, delayTime) * feedbackMultiplier
	}
};
let r0 = 7;
let root = 45;
let bass = Impulse(r0, 0).in { :t |
	let bassf = Impulse(r0 / (3 * 8), 0).in { :u |
		Perc(t, 0, 0.013, 0)
		.LinLin(0, 1, 0, 12 * 3)
		.Plus(Sequencer([0, 0, -2, -2, 0, 0, 3, 3], u))
		.Plus(root)
		.MidiCps
	};
	SinOsc(bassf, 0)
	.Times(Sequencer([1, 0, 0.35], t))
	.Times(Perc(t, 0.01, 0.13, 0))
};
let padd = 3 * 8;
let padt = padd / r0;
let pad = Impulse(r0 / padd, 0).in { :t |
	Sequencer([19, 15, 10, 17, 19, 15, 14, 22], t)
	.Plus(root)
	.Plus(SinOsc(2.4, 0).Times(0.18))
	.Plus([0.06, -0.06])
	.MidiCps
	.SinOsc(0)
	.Times(Saw(r0 / padd).Lag(0.1).LinLin(-1, 1, 0, 1))
	.Times(SinOsc(2.7, 0).LinLin(-1, 1, 0.4, 1))
	.withDelayed(4 / 12 * padt, 0.7)
	.Times(0.77)
};
let mel = Impulse(r0, 0).in { :t |
	let u = Impulse(r0 / (3 * 16), 0);
	Sequencer([0, 1, 2, 1, 3], t)
	.Select(
		[
			Sequencer([0, -2, 0, 3], u),
			Sequencer([7, 5, 7, 10], u),
			Sequencer([12, 10, 12, 14], u),
			Sequencer([15, 14, 15, 17], u)
		]
	)
	.Plus(Sequencer([1, 2, 3, 2], t) * 12)
	.Plus(root)
	.MidiCps
	.SinOsc(0)
	.Times(
		Perc(
			t,
			TExpRand(0.002, 0.05, t),
			TExpRand(0.05, 0.11, t),
			0
		).Power(2)
	)
	.Times(Sequencer([1, 1, 0, 1, 1, 1, 0], t))
	.EqPan2(TRand(-0.7, 0.7, t))
	.withDelayed(2.01 / 24 * padt, 0.65)
	.Times(0.3)
};
bass + pad + mel * 0.25
