/* sinOsc ; phase value = (0, 2.pi), offset to lowest and midpoint ascending */
sinOsc(110, 2.pi * [0.75, 0]) * 0.1

/* sinOsc */
{
	let tr = dust(1);
	let freq = tRand(3785, 3800, tr);
	let amp = sinOsc(tRand(10, 30, tr), 0) * 0.2;
	let osc = sinOsc(freq, 0) * amp + sinOsc({ tRand(2.91, 3.02, tr) } ! 2 * freq, 0);
	let env = decay2(tr, 0.01, 1);
	osc * env * 0.4
} !> 12

/* sinOsc ; two oscillators ; frequencies approach 500 from opposite directions */
let lfo = mouseX(1, 0, 0, 0.2);
let sig = sinOsc(linExp(lfo, 0, 1, 100, 500), 0) + sinOsc(linExp(lfo, 0, 1, 1000, 500), 0);
sig * 0.1

/* sinOsc ; https://scsynth.org/t/5169/5 (dietcv) */
{ :tr |
	let syncEgTop = tRand(8, 20, tr);
	let syncRatio = 2;
	let syncDcy = tRand(0.5, 2, tr);
	let syncEnv = txLine(syncEgTop / syncRatio, 1, syncDcy, tr);
	let gainEnv = adsr(trig(tr, syncDcy), 0.3, 0.3, 0.5, 0.1, -4);
	let freq = { tChoose(tr, [45, 48, 52, 53, 57, 58, 60, 64, 65, 70]).midiCps } ! 5;
	let in = lfTri(freq, 0);
	let phase = sweep(in, freq * syncRatio * syncEnv);
	let synced = sinOsc(0, (phase % 1) * 2.pi).square;
	let sig = synced * in * gainEnv;
	sig.splay2 * 0.2
}.overlapTexture(2, 0, 2).mix

/* https://scsynth.org/t/6264/2 */
let numPartials = 64;
let spectrum = [1 .. numPartials];
let inharmonic = mouseX(0.002, 0.008, 0, 0.2);
let tension = (1 + (spectrum * spectrum * inharmonic)).signedSqrt;
let tilt = mouseY(-5, -1, 0, 0.2);
let ampList = (spectrum.log2 * tilt).dbAmp;
let freq0 = 110;
let freq = freq0 * spectrum * tension;
let sig = sinOsc(freq, { rand(0, 2.pi) } ! numPartials);
(sig * ampList).sum / numPartials

/* sinOsc ; https://scsynth.org/t/6256/5 ; bipolar version */
let freq = 130;
let squeezeStretch = lfTri(0.1, 0) * 5;
let tri = lfTri(freq, 1) * 0.5 + 0.5;
let pulse = lfPulse(freq, 0, 0.5) * 2 - 1;
let outPhase = pulse * (tri ^ (2 ^ squeezeStretch));
sinOsc(0, outPhase.pi) * 0.1

/* sinOsc ; https://llllllll.co/t/45623/25 */
let freqBase = 200;
let freqRes = mouseY(100, 1200, 0, 0.2);
let pdbase = impulse(freqBase, 0);
let pd = phasor(pdbase, 2.pi* freqBase / sampleRate(), 0, 2.pi, 0);
let pdres = phasor(pdbase, 2.pi * freqRes / sampleRate(), 0, 2.pi, 0);
let pdi = linLin((2.pi - pd).max(0), 0, 2.pi, 0, 1);
lag(sinOsc(0, pdres) * pdi, 1 / freqBase)

/* sinOsc ; https://scsynth.org/t/6264/9 (es) */
let freq = [440, 880];
let k = 12000 * (sampleRate() / 44100) / (freq * freq.log);
let sinSig = sinOsc(freq, 0);
let cosSig = sinOsc(freq, 1/2.pi);
let sqSig = (sinSig * k).tanh;
let sawSig = sqSig * (cosSig + 1);
sawSig * 0.1

/* sinOsc ; https://scsynth.org/t/6264/8 (fm) */
let freq = 110;
let indexLimit = 1.5;
let index = linLin(sinOsc(1 / 10, 3.pi / 2), -1, 1, 1, indexLimit);
let phase = index * localIn(1, 1);
let sig = sinOsc(freq, phase) + sinOsc(freq * 0.001, index * localIn(1, 1)).softClip;
sig <! localOut(sig) * 0.1

/* sinOsc */
sinOsc(440, 0) * 0.1

/* sinOsc ; used as both oscillator and lfo */
let f = sinOsc(4, 0);
sinOsc(f * 200 + 400, 0) * 0.1

/* sinOsc ; cancellation (silence) */
let o1 = sinOsc(440, 0);
let o2 = sinOsc(440, 1.pi);
o1 + o2

/* sinOsc ; modulate freq */
let f1 = xLine(1, 1000, 9);
let f2 = sinOsc(f1, 0) * 200 + 800;
sinOsc(f2, 0) * 0.25

/* sinOsc ; modulate phase */
let ph = sinOsc(xLine(20, 8000, 10), 0) * 2.pi;
sinOsc(800, ph) * 0.1

/* sinOsc ; phase input only */
let ph = sinOsc(xLine(20, 8000, 10), 0) * 2.pi;
sinOsc(0, ph) * 0.1

/* sinOsc ; multiple channel expansion */
sinOsc([220, 221], 0) * 0.1

/* sinOsc ; multiple channel expansion ; named variable */
let freq = [220 221];
sinOsc(freq, 0) * 0.1

/* sinOsc ; mix to two channel */
sinOsc([220 221 440 441], 0).splay2 * 0.1

/* sinOsc ; nested mce */
sinOsc([220 221; 440 441], 0).mix * 0.1

/* sinOsc ; http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html */
let freqSweep = line(4000, 1000, 10);
sinOsc([freqSweep, freqSweep + 400], 0).mean

/* sinOsc */
sinOsc(
	lfNoise2(
		sinOsc([3, 5], 0).linLin(-1, 1, [2, 7], 35)
	).linLin(-1, 1, 100, [200, 300]),
	0
) * 0.1

/* sinOsc ; simple fm */
let modFreq = [400, mouseX(400, 700, 1, 0.2)];
let modDev = sinOsc(lfNoise2(1) + 1, 0).abs * 1200;
let modOsc = sinOsc(modFreq, 0) * modDev;
let carFreq = [400, mouseY(400, 500, 1, 0.2)];
sinOsc(carFreq + modOsc, 0) * lfNoise2([1, 2]).linLin(-1, 1, 0, 0.1)

/* sinOsc ; simple fm */
let modFreq = mouseX(1, 1000, 1, 0.2);
let modDev = mouseY(0, [100, 700], 0, 0.2);
let modOsc = sinOsc(modFreq, 0) * modDev;
let carFreq = 400;
let carAmp = 0.1;
sinOsc(carFreq + modOsc, 0) * carAmp

/* sinOsc ; simple fm ; modIndex */
let modFreq = mouseX(1, 1000, 1, 0.2);
let modIndex = mouseY(0, [7, 11], 0, 0.2);
let modDev = modFreq * modIndex;
let modOsc = sinOsc(modFreq, 0) * modDev;
let carFreq = 440;
let carAmp = 0.1;
sinOsc(carFreq + modOsc, 0) * carAmp

/* sinOsc ; simple fm ; modRatio & carRatio */
let freq = 440;
let modRatio = mouseX(0.1, 10, 1, 0.2);
let modDev = mouseY(0, 100, 0, 0.2);
let modOsc = sinOsc(freq * modRatio, 0) * modDev;
let carRatio = [1, 1 / 3] / modRatio;
let carAmp = 0.1;
sinOsc(freq * carRatio + modOsc, 0) * carAmp

/* sinOsc ; SuperCollider derived temporaries syntax with initialiser expressions */
let freq = 440; let phase = 0; let amp = 0.1;
sinOsc(freq, phase) * amp

/* sinOsc ; requires 0.max(aUgen) */
let n = 16;
{
	let amp = 0.max(sinOsc(expRand(0.1, 1), rand(0, 2.pi))) / n / 2;
	eqPan(
		sinOsc(expRand(100, 1000), 0) * amp,
		rand(-1, 1)
	)
} !+ n

/* sinOsc ; Fm ; https://github.com/Thrifleganger/VisualSynth ; Event control */
let fmSignal = Voicer(1, 16) { :e |
	let index = e.y * 3;
	let pitch = e.x * 24 + 48;
	let ratio = 3.5;
	let amp = 0.5;
	let gate = e.w;
	let pan = e.i * 2 - 1;
	let tone = 1;
	let attack = 0.01;
	let sustain = 0.5;
	let release = 1;
	let decay = 0.3;
	let duration = 1;
	let volModDepth = 0;
	let volModRate = 2;
	let pitchModDepth = 0;
	let pitchModRate = 2;
	let panModDepth = 0;
	let panModRate = 2;
	let indexEnv = tLine(index, 0.2, duration, gate);
	let volEnv = adsr(gate, attack, decay, sustain, release, -4);
	let volMod = sinOsc(volModRate, 0) * volModDepth / 2 + 0.5;
	let panMod = sinOsc(panModRate, 0) * panModDepth;
	let pitchMod = sinOsc(pitchModRate, 0) * pitchModDepth;
	let mod = sinOsc(pitch * ratio, 0) * pitch * indexEnv;
	let car = sinOsc(pitch * (2 ^ (pitchMod / 1200)) + mod, 0) * volEnv * amp;
	let filter = lpf(car * volMod, linExp(tone, 0, 1, 200, 20000));
	eqPan2(filter, (panModDepth < 0.01).if { pan } { panMod })
}.mix;
let delayMix = 0.5;
let delayTime = 0.3;
let delayFeedback = 0.3;
let feedbackSignal = localIn(2, 0);
let delayReturn = delayL(fmSignal + feedbackSignal, 5, delayTime);
let delaySignal = (fmSignal + (delayReturn * delayMix)) <! localOut(delayReturn * delayFeedback);
let reverbMix = 0.5;
freeVerb(delaySignal, reverbMix, 0.8, 0.5)

/* alarm */
let tone = sinOsc([600, 800], 0);
let control = lpf(lfPulse(2, 0, 0.5), 70);
selectX(control, tone) * 0.1

/* alarm */
let tone = sinOsc([723, 932, 1012], 0);
let control = lpf(stepper(impulse(23, 0), 0, 0, 2, 1, 0), 70);
selectX(control, tone) * 0.1

/* alarm ; mouse selects timbre */
let freq = lpf(sequencer([723 932 1012], impulse(1 / 0.05, 0)), 70);
let osc = sinOsc(freq, 0);
let operations = [osc, osc.pi.sin, osc.pi.cos, (osc + 0.25).pi.cos];
selectX(mouseX(0, 4, 0, 0.2), operations) * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
let o = { :freq :lo :hi |
	sinOsc(freq, 0).linLin(-1, 1, lo, hi)
};
sinOsc(
	o(
		o(3, 4, 20),
		o(0.75, 50, 70),
		o(0.5, 100, 200 + [11, 22])
	),
	0
) / 5

/* ---- sinOsc ; mce ; two out ; each single channel ; hence mono */
sinOsc([[440], [441]], 0).sum * 0.1
