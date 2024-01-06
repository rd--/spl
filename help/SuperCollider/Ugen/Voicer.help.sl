(* SinOsc ; event control ; p-field *)
Voicer(1, 16) { :e |
	SinOsc(e.p.UnitCps, 0) * e.w * e.z
}.Splay

(* SinOsc ; event control ; x-field *)
Voicer(1, 16) { :e |
	EqPan2(SinOsc((e.x * 24 + 48).MidiCps, 0), e.i * 2 - 1) * e.z * e.w
}.Mix

(* Blip ; event control ; shared parameter *)
let nh = 1;
Voicer(1, 16) { :e |
	Blip(e.p.UnitCps, nh) * e.w * e.z
}.Splay

(* Blip ; event control *)
Voicer(1, 16) { :e |
	EqPan2(Blip(e.p.UnitCps, e.y * 10 + 1), e.i * 2 - 1) * e.w * e.z * e.z
}.Mix

(* Blip ; event control *)
Voicer(1, 16) { :e |
	EqPan2(Blip(e.p.UnitCps, e.i * 10 + 1), e.j * 2 - 1) * e.w * e.z / 9
}.Mix

(* PanAz ; event control *)
let nc = 2;
Voicer(1, 16) { :e |
	PanAz(
		nc,
		Blip(e.p.UnitCps, e.y * 3 + 1),
		e.i * 2 - 1,
		1,
		3,
		0
	) * e.w * e.z * e.z
}.Sum

(* Dictionary ; Voicer *)
(
	w: SinOsc(1 / [5, 7], 0),
	x: SinOsc(1 / [13, 17], 0)
).Voicer { :e |
	SinOsc(e.x * 222 + 333, 0) * e.w * 0.2
}

(* blip ; event control ; requires=keywords *)
Voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		EqPan2(
			in: Blip(
				freq: e.p.UnitCps,
				numHarm: e.y * 10 + 1
			),
			pos: e.i * 2 - 1
		) * e.w * e.z * e.z
	}
).Sum

(* MembraneCircle ; event control ; note limited voice count ; requires=keywords *)
Voicer(
	part: 1,
	numVoices: 6,
	voiceFunc: { :e |
		let loss = LinExp(
			in: e.y,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.99999,
			dstHi: 0.99950
		);
		let wobble = SinOsc(
			freq: 2,
			phase: 0
		);
		let tension = LinExp(
			in: e.x,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.01,
			dstHi: 0.1
		) + (wobble * 0.0001);
		let env = Perc(
			trig: e.w,
			attackTime: 0.0001,
			releaseTime: 1 - e.z,
			curve: -4
		) * (e.z + (e.y / 4));
		EqPan2(
			in: MembraneCircle(
				excitation: PinkNoise() * env,
				tension: tension,
				loss: loss
			),
			pos: e.i * 2 - 1
		)
	}
).Mix

(* pluck ; event control ; requires=keywords *)
Voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		let n = WhiteNoise() * e.z * 2;
		let dlMax = 1 / 220;
		let dl = dlMax * (1 - e.x * 0.9);
		EqPan2(
			in: Pluck(
				in: n,
				trig: e.w,
				maxDelayTime: dlMax,
				delayTime: dl,
				decayTime: 10,
				coef: e.y / 3
			),
			pos: e.i * 2 - 1
		)
	}
).Sum

(* resonz ; pinkNoise ; event control ; requires=keywords *)
Voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		EqPan2(
			in: Resonz(
				in: PinkNoise(),
				freq: (e.x * 24 + 48).MidiCps,
				bwr: e.y * 0.25
			) * 24,
			pos: e.i * 2 - 1
		) * e.z.Squared * e.w
	}
).Sum
