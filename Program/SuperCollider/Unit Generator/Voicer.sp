/* sinOsc ; Event control ; p */
voicer(1, 16) { :e |
	sinOsc(e.p.unitCps, 0) * e.w * e.z
}.splay

/* sinOsc ; Event control ; x */
voicer(1, 16) { :e |
	eqPan2(sinOsc((e.x * 24 + 48).midiCps, 0), e.i * 2 - 1) * e.z * e.w
}.mix

/* blip ; Event control ; Shared parameter */
let nh = 1;
voicer(1, 16) { :e |
	blip(e.p.unitCps, nh) * e.w * e.z
}.splay

/* blip ; Event control */
voicer(1, 16) { :e |
	eqPan2(blip(e.p.unitCps, e.y * 10 + 1), e.i * 2 - 1) * e.w * e.z * e.z
}.mix

/* blip ; Event control */
voicer(1, 16) { :e |
	eqPan2(blip(e.p.unitCps, e.i * 10 + 1), e.j * 2 - 1) * e.w * e.z / 9
}.mix

/* panAz ; Event control */
let nc = 2;
voicer(1, 16) { :e |
	panAz(
		nc,
		blip(e.p.unitCps, e.y * 3 + 1),
		e.i * 2 - 1,
		1,
		3,
		0
	) * e.w * e.z * e.z
}.sum

/* Dictionary ; voicer */
(
	w: sinOsc(1 / [5, 7], 0),
	x: sinOsc(1 / [13, 17], 0)
).voicer { :e |
	sinOsc(e.x * 222 + 333, 0) * e.w * 0.2
}

/* blip ; Event control ; requires=keywords */
voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		eqPan2(
			in: blip(
				freq: e.p.unitCps,
				numHarm: e.y * 10 + 1
			),
			pos: e.i * 2 - 1
		) * e.w * e.z * e.z
	}
).sum

/* MembraneCircle ; Event control ; Note limited voice count ; requires=keywords */
voicer(
	part: 1,
	numVoices: 6,
	voiceFunc: { :e |
		let loss = (
			in: e.y,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.99999,
			dstHi: 0.99950
		).linExp;
		let wobble = sinOsc(
			freq: 2,
			phase: 0
		);
		let tension = (
			in: e.x,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.01,
			dstHi: 0.1
		).linExp + (wobble * 0.0001);
		let env = perc(
			trig: e.w,
			attackTime: 0.0001,
			releaseTime: 1 - e.z,
			curve: -4
		) * (e.z + (e.y / 4));
		eqPan2(
			in: membraneCircle(
				excitation: pinkNoise() * env,
				tension: tension,
				loss: loss
			),
			pos: e.i * 2 - 1
		)
	}
).mix

/* pluck ; Event control ; requires=keywords */
voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		let n = whiteNoise() * e.z * 2;
		let dlMax = 1 / 220;
		let dl = dlMax * (1 - e.x * 0.9);
		eqPan2(
			in: pluck(
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
).sum

/* resonz ; pinkNoise ; Event control ; requires=keywords */
voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		eqPan2(
			in: resonz(
				in: pinkNoise(),
				freq: (e.x * 24 + 48).midiCps,
				bwr: e.y * 0.25
			) * 24,
			pos: e.i * 2 - 1
		) * e.z.square * e.w
	}
).sum
