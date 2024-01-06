(* Phasor ; phase modulation ; mouse control *)
let carFreq = 440;
let modFreq = MouseX(1, 1000, 1, 0.2);
let modIndex = MouseY(0, 100, 0, 0.2);
let modDev = modFreq * modIndex;
let rateConversion = 2 * pi / SampleRate();
let phase = Phasor(0, carFreq * rateConversion, 0, 2 * pi, 0);
let phaseOffset = SinOsc(modFreq, 0) * modDev * rateConversion;
[SinOsc(0, phase + phaseOffset), SinOsc(carFreq, 0)] * 0.1

(* SinOsc ; phase input ; constant frequency *)
let freq = 440;
let rate = 2 * pi * freq / SampleRate();
let phase = Phasor(1, rate, 0, 2 * pi, 0);
SinOsc(0, phase) * 0.1

(* Phasor ; https://scsynth.org/t/8528/2 *)
let raisedCos = { :phase :index |
	let cosine = (phase * 2.pi).Cos;
	(index.Abs * (cosine - 1)).Exp
};
let rate = 110;
let modRatio = 2.5;
let index = SinOsc(0.3, 0).LinLin(-1, 1, 0, 30);
let modPhase = Phasor(Dc(0), rate * modRatio * SampleDur(), 0, 1, 0);
let mod = (modPhase * 2.pi).Sin;
let raisedCosWindow = raisedCos(modPhase, index);
let carPhase = Phasor(Dc(0), rate * SampleDur(), 0, 1, 0);
let car = (carPhase * 2.pi + (mod * index)).Sin;
let sig = car * raisedCosWindow;
LeakDc(sig, 0.995) * 0.1
