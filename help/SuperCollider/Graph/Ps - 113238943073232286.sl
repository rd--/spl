/* https://anticapitalist.party/@ahihi/113238943073232286 */
let r0 = 7;
let t1 = Impulse(r0, 0);
let t2 = Impulse(r0 / (3 * 8), 0);
let t3 = Impulse(r0 / (3 * 16), 0);
let root = 45;
let seq = { :t :l | Sequencer(l, t) };
let ar = { :t :a :r | Perc(t, a, r, 0) };
let bassf = [
	t1.ar(0, 0.013).LinLin(0, 1, 0, 12 * 3),
	t2.seq([0, 0, -2, -2, 0, 0, 3, 3]),
	root
].Sum.MidiCps;
let bass = SinOsc(bassf, 0) * t1.seq([1, 0, 0.35]) * t1.ar(0.01, 0.13);
let padd = 3 * 8;
let padt = padd / r0;
let withDelayed = { :x :dt :m |
	let buffer = BufAlloc(1, 48000 * dt + 1).BufClear;
	let delayedSignal = DelayTap(buffer, dt);
	let mixedSignal = x + (delayedSignal * m);
	let writer = DelayWrite(buffer, mixedSignal);
	mixedSignal <! writer
};
let pad = Impulse(r0 / padd, 0).with { :t |
	t.seq([19, 15, 10, 17, 19, 15, 14, 22])
	.Add(root)
	.Add(SinOsc(2.4, 0) * 0.18)
	.Add([0.06, -0.06])
	.MidiCps
	.SinOsc(0)
	.Mul(Saw(r0 / padd).Lag(0.1).LinLin(-1, 1, 0, 1))
	.Mul(SinOsc(2.7, 0).LinLin(-1, 1, 0.4, 1))
}.withDelayed(4 / 12 * padt, 0.7).Mul(0.77);
let mel = Impulse(r0, 0).with { :t |
	t.seq([0, 1, 2, 1, 3]).Select([
		t3.seq([0, -2, 0, 3]),
		t3.seq([7, 5, 7, 10]),
		t3.seq([12, 10, 12, 14]),
		t3.seq([15, 14, 15, 17])
	])
	.Add(t.seq([1, 2, 3, 2]) * 12)
	.Add(root)
	.MidiCps
	.SinOsc(0)
	.Mul(
		t.ar(
			TExpRand(0.002, 0.05, t),
			TExpRand(0.05, 0.11, t)
		).Pow(2)
	)
	.Mul(t.seq([1, 1, 0, 1, 1, 1, 0]))
	.EqPan2(TRand(-0.7, 0.7, t))
	.withDelayed(2.01 / 24 * padt, 0.65)
	.Mul(0.3)
};
bass + pad + mel * 0.25
