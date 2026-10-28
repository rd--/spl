/* https://anticapitalist.party/@ahihi/113238943073232286 */
let withDelayed = { :in :delayTime :feedbackMultiplier |
	feedforwardFeedbackward(in, +) { :x |
		delayN(x, delayTime, delayTime) * feedbackMultiplier
	}
};
let r0 = 7;
let root = 45;
let bass = impulse(r0, 0).in { :t |
	[
		sinOsc(
			[
				perc(t, 0, 0.013, 0).linLin(0, 1, 0, 12 * 3),
				sequencer([0, 0, -2, -2, 0, 0, 3, 3], impulse(r0 / (3 * 8), 0)),
				root
			].sum.midiCps,
			0
		),
		sequencer([1, 0, 0.35], t),
		perc(t, 0.01, 0.13, 0)
	].product
};
let padd = 3 * 8;
let padt = padd / r0;
let pad = impulse(r0 / padd, 0).in { :t |
	[
		sinOsc(
			[
				sequencer(
					[19, 15, 10, 17, 19, 15, 14, 22],
					t
				),
				root,
				sinOsc(2.4, 0) * 0.18,
				[0.06, -0.06]
			].sum.midiCps,
			0
		),
		saw(r0 / padd).lag(0.1).linLin(-1, 1, 0, 1),
		sinOsc(2.7, 0).linLin(-1, 1, 0.4, 1)
	].product.withDelayed(4 / 12 * padt, 0.7) * 0.77
};
let mel = impulse(r0, 0).in { :t |
	let u = impulse(r0 / (3 * 16), 0);
	eqPan2(
		[
			sinOsc(
				[
					sequencer([0, 1, 2, 1, 3], t).selectT(
						[
							sequencer([0, -2, 0, 3], u),
							sequencer([7, 5, 7, 10], u),
							sequencer([12, 10, 12, 14], u),
							sequencer([15, 14, 15, 17], u)
						]
					),
					sequencer([1, 2, 3, 2], t) * 12,
					root
				].sum.midiCps,
				0
			),
			perc(
				t,
				tExpRand(0.002, 0.05, t),
				tExpRand(0.05, 0.11, t),
				0
			) ^ 2,
			sequencer([1, 1, 0, 1, 1, 1, 0], t)
		].product,
		tRand(-0.7, 0.7, t)
	).withDelayed(2.01 / 24 * padt, 0.65) * 0.3
};
bass + pad + mel * 0.25
