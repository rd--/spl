/* shift register (dm) ; http://sccode.org/1-590 ; erratic ? */
let amp = 0.1;
let pulse = impulse(1 / 16, 0);
let rate = tChoose(pulse, [3, 5, 10]);
let trans = tChoose(pulse, [0, 2, -2, 7, -5]);
let trig = trig1(cuspL(rate.kr * 3, 1, 1.9, 0), 0.001);
let octave = demand(pulseDivider(trig, 4, 0), 0, drand(Infinity, [12, -12]));
let note = demand(trig, 0, dseq(Infinity, [42, 46, 51, 54, 59, 63, 66].shuffle + trans.kr) + octave);
let length = 5;
let buf = bufAlloc(1, length);
let count = pulseCount(trig, 0);
let chord = demand(
	trig,
	0,
	dbufrd(buf, count + [1 .. length], 1)
).reverse <! demand(
	trig,
	0,
	dbufwr(buf, count, note, 1)
);
let chordCps = chord.midiCps;
let cf = vibrato(chordCps, 6, 0.02, 0, 0, 0.04, 0.1, 0, 0);
let mf = chordCps * linLin(lfPulse(1 / 8, 0, 0.5), 0, 1, 1.01, 2.01);
let sig = pmOsc(cf, mf, txLine(3, 0.0001, 0.2, trig), 0);
let cmp = (sig * ampCompA(chordCps, 0, 0.32, 1) * amp).sum;
xFade2(
	[cmp, cmp],
	gVerb(bpf(cmp, 90.midiCps, 1), 50, 8, 0.5, 0.5, 15, 0, 0.7, 0.5, 300),
	0.2,
	1
)
