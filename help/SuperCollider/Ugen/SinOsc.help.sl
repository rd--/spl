(* SinOsc ; phase value = (0, 2 * pi), offset to lowest and midpoint ascending *)
SinOsc(110, 2 * pi * [0.75, 0]) * 0.1

(* SinOsc *)
{
	let tr = Dust(1);
	let freq = TRand(3785, 3800, tr);
	let amp = SinOsc(TRand(10, 30, tr), 0) * 0.2;
	let osc = SinOsc(freq, 0) * amp + SinOsc({ TRand(2.91, 3.02, tr) } ! 2 * freq, 0);
	let env = Decay2(tr, 0.01, 1);
	osc * env * 0.4
} !> 12

(* SinOsc ; two oscillators ; frequencies approach 500 from opposite directions *)
let lfo = MouseX(1, 0, 0, 0.2);
let sig = SinOsc(LinExp(lfo, 0, 1, 100, 500), 0) + SinOsc(LinExp(lfo, 0, 1, 1000, 500), 0);
sig * 0.1

(* SinOsc ; https://scsynth.org/t/5169/5 (dietcv) *)
{ :tr |
	let syncEgTop = TRand(8, 20, tr);
	let syncRatio = 2;
	let syncDcy = TRand(0.5, 2, tr);
	let syncEnv = TxLine(syncEgTop / syncRatio, 1, syncDcy, tr);
	let gainEnv = Adsr(Trig(tr, syncDcy), 0.3, 0.3, 0.5, 0.1, -4);
	let freq = { Choose(tr, [45, 48, 52, 53, 57, 58, 60, 64, 65, 70]).MidiCps } ! 5;
	let in = LfTri(freq, 0);
	let phase = Sweep(in, freq * syncRatio * syncEnv);
	let synced = SinOsc(0, (phase % 1) * 2 * pi).Squared;
	let sig = synced * in * gainEnv;
	sig.Splay2 * 0.2
}.OverlapTexture(2, 0, 2).Mix

(* https://scsynth.org/t/6264/2 *)
let numPartials = 64;
let spectrum = [1 .. numPartials];
let inharmonic = MouseX(0.002, 0.008, 0, 0.2);
let tension = (1 + (spectrum * spectrum * inharmonic)).Sqrt;
let tilt = MouseY(-5, -1, 0, 0.2);
let ampArray = (spectrum.log2 * tilt).DbAmp;
let freq0 = 110;
let freq = freq0 * spectrum * tension;
let sig = SinOsc(freq, { Rand(0, 2 * pi) } ! numPartials);
(sig * ampArray).Sum / numPartials

(* SinOsc ; https://scsynth.org/t/6256/5 ; bipolar version *)
let freq = 130;
let squeezeStretch = LfTri(0.1, 0) * 5;
let tri = LfTri(freq, 1) * 0.5 + 0.5;
let pulse = LfPulse(freq, 0, 0.5) * 2 - 1;
let outPhase = pulse * (tri ^ (2 ^ squeezeStretch));
SinOsc(0, outPhase * pi) * 0.1

(* SinOsc ; https://llllllll.co/t/45623/25 *)
let freqBase = 200;
let freqRes = MouseY(100, 1200, 0, 0.2);
let pdbase = Impulse(freqBase, 0);
let pd = Phasor(pdbase, 2 * pi* freqBase / SampleRate(), 0, 2 * pi, 0);
let pdres = Phasor(pdbase, 2 * pi * freqRes / SampleRate(), 0, 2 * pi, 0);
let pdi = LinLin((2 * pi - pd).Max(0), 0, 2 * pi, 0, 1);
Lag(SinOsc(0, pdres) * pdi, 1 / freqBase)

(* SinOsc ; https://scsynth.org/t/6264/9 (es) *)
let freq = [440, 880];
let k = 12000 * (SampleRate() / 44100) / (freq * freq.log);
let sinSig = SinOsc(freq, 0);
let cosSig = SinOsc(freq, pi / 2);
let sqSig = (sinSig * k).Tanh;
let sawSig = sqSig * (cosSig + 1);
sawSig * 0.1

(* SinOsc ; https://scsynth.org/t/6264/8 (fm) *)
let freq = 110;
let indexLimit = 1.5;
let index = LinLin(SinOsc(1 / 10, 3 * pi / 2), -1, 1, 1, indexLimit);
let phase = index * LocalIn(1, 1);
let sig = SinOsc(freq, phase) + SinOsc(freq * 0.001, index * LocalIn(1, 1)).SoftClip;
sig <! LocalOut(sig) * 0.1

(* SinOsc *)
SinOsc(440, 0) * 0.1

(* SinOsc ; used as both oscillator and lfo *)
let f = SinOsc(4, 0);
SinOsc(f * 200 + 400, 0) * 0.1

(* SinOsc ; cancellation (silence) *)
let o1 = SinOsc(440, 0);
let o2 = SinOsc(440, pi);
o1 + o2

(* SinOsc ; modulate freq *)
let f1 = XLine(1, 1000, 9);
let f2 = SinOsc(f1, 0) * 200 + 800;
SinOsc(f2, 0) * 0.25

(* SinOsc ; modulate phase *)
let ph = SinOsc(XLine(20, 8000, 10), 0) * 2 * pi;
SinOsc(800, ph) * 0.1

(* SinOsc ; phase input only *)
let ph = SinOsc(XLine(20, 8000, 10), 0) * 2 * pi;
SinOsc(0, ph) * 0.1

(* SinOsc ; multiple channel expansion *)
SinOsc([220, 221], 0) * 0.1

(* SinOsc ; multiple channel expansion ; named variable *)
let freq = [220 221];
SinOsc(freq, 0) * 0.1

(* SinOsc ; mix to two channel *)
SinOsc([220 221 440 441], 0).Splay2 * 0.1

(* SinOsc ; nested mce *)
SinOsc([220 221; 440 441], 0).Mix * 0.1

(* SinOsc ; http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html *)
let freqSweep = Line(4000, 1000, 10);
SinOsc([freqSweep, freqSweep + 400], 0).mean

(* SinOsc *)
SinOsc(
	LfNoise2(
		SinOsc([3, 5], 0).Range([2, 7], 35)
	).Range(100, [200, 300]),
	0
) * 0.1

(* SinOsc ; simple fm *)
let modFreq = [400, MouseX(400, 700, 1, 0.2)];
let modDev = SinOsc(LfNoise2(1) + 1, 0).Abs * 1200;
let modOsc = SinOsc(modFreq, 0) * modDev;
let carFreq = [400, MouseY(400, 500, 1, 0.2)];
SinOsc(carFreq + modOsc, 0) * LfNoise2([1, 2]).Range(0, 0.1)

(* SinOsc ; simple fm *)
let modFreq = MouseX(1, 1000, 1, 0.2);
let modDev = MouseY(0, [100, 700], 0, 0.2);
let modOsc = SinOsc(modFreq, 0) * modDev;
let carFreq = 400;
let carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp

(* SinOsc ; simple fm ; modIndex *)
let modFreq = MouseX(1, 1000, 1, 0.2);
let modIndex = MouseY(0, [7, 11], 0, 0.2);
let modDev = modFreq * modIndex;
let modOsc = SinOsc(modFreq, 0) * modDev;
let carFreq = 440;
let carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp

(* SinOsc ; simple fm ; modRatio & carRatio *)
let freq = 440;
let modRatio = MouseX(0.1, 10, 1, 0.2);
let modDev = MouseY(0, 100, 0, 0.2);
let modOsc = SinOsc(freq * modRatio, 0) * modDev;
let carRatio = [1, 1 / 3] / modRatio;
let carAmp = 0.1;
SinOsc(freq * carRatio + modOsc, 0) * carAmp

(* SinOsc ; SuperCollider derived temporaries syntax with initialiser expressions *)
let freq = 440; let phase = 0; let amp = 0.1;
SinOsc(freq, phase) * amp

(* SinOsc ; requires 0.Max(aUgen) *)
let n = 16;
{
	let amp = 0.Max(SinOsc(ExpRand(0.1, 1), Rand(0, 2 * pi))) / n / 2;
	EqPan(
		SinOsc(ExpRand(100, 1000), 0) * amp,
		Rand(-1, 1)
	)
} !+ n

(* SinOsc ; fm ; https://github.com/Thrifleganger/VisualSynth ; requires=Voicer *)
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
	let indexEnv = TLine(index, 0.2, duration, gate);
	let volEnv = Adsr(gate, attack, decay, sustain, release, -4);
	let volMod = SinOsc(volModRate, 0) * volModDepth / 2 + 0.5;
	let panMod = SinOsc(panModRate, 0) * panModDepth;
	let pitchMod = SinOsc(pitchModRate, 0) * pitchModDepth;
	let mod = SinOsc(pitch * ratio, 0) * pitch * indexEnv;
	let car = SinOsc(pitch * (2 ^ (pitchMod / 1200)) + mod, 0) * volEnv * amp;
	let filter = Lpf(car * volMod, LinExp(tone, 0, 1, 200, 20000));
	EqPan2(filter, (panModDepth < 0.01).if { pan } { panMod })
}.Mix;
let delayMix = 0.5;
let delayTime = 0.3;
let delayFeedback = 0.3;
let feedbackSignal = LocalIn(2, 0);
let delayReturn = DelayL(fmSignal + feedbackSignal, 5, delayTime);
let delaySignal = (fmSignal + (delayReturn * delayMix)) <! LocalOut(delayReturn * delayFeedback);
let reverbMix = 0.5;
FreeVerb(delaySignal, reverbMix, 0.8, 0.5)

(* alarm *)
let tone = SinOsc([600, 800], 0);
let control = Lpf(LfPulse(2, 0, 0.5), 70);
SelectX(control, tone) * 0.1

(* alarm *)
let tone = SinOsc([723, 932, 1012], 0);
let control = Lpf(Stepper(Impulse(23, 0), 0, 0, 2, 1, 0), 70);
SelectX(control, tone) * 0.1

(* alarm ; mouse selects timbre *)
let freq = Lpf(Sequencer([723 932 1012], Impulse(1 / 0.05, 0)), 70);
let osc = SinOsc(freq, 0);
let operations = [osc, (osc * pi).Sin, (osc * pi).Cos, ((osc + 0.25) * pi).Cos];
Select(MouseX(0, 4, 0, 0.2), operations) * 0.1

(* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft *)
let o = { :freq :lo :hi |
	SinOsc(freq, 0).Range(lo, hi)
};
SinOsc(
	o(
		o(3, 4, 20),
		o(0.75, 50, 70),
		o(0.5, 100, 200 + [11, 22])
	),
	0
) / 5

(* ---- SinOsc ; mce ; two out ; each single channel ; hence mono *)
SinOsc([[440], [441]], 0).Sum * 0.1
