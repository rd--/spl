/* requires=kr ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html */
let n = 11;
let z = {
	let freq = Rand(50, 560.3);
	let numCps = Rand(2, 20);
	let kNum = MulAdd(SinOsc(ExpRand(0.02, 0.2), 0), numCps / 2, numCps / 2);
	let osc = Gendy1(
		Rand(0, 6),
		Rand(0, 6),
		Rand(0, 1),
		Rand(0, 1),
		freq,
		freq,
		Rand(0, 1),
		Rand(0, 1),
		numCps,
		kNum.kr
	);
	Pan2(osc, Rand(-1, 1), 0.5 / n.sqrt)
} !> n;
Resonz(z, MouseX(100, 2000, 0, 0.2), MouseY(0.01, 1.0, 0, 0.2))

/* tutorial 2.1 ; sawtooth */
let n = 9;
0:n.collect { :i |
	let mult = (-1 ^ i) * (0.5 / (i + 1));
	SinOsc(440 * (i + 1), 0) * mult
}.Sum / n

/* tutorial 2.1 ; square */
let n = 9;
0:n.collect { :i |
	let harmonicnumber = 2 * i + 1;
	SinOsc(440 * harmonicnumber, 0) / harmonicnumber
}.Sum / n

/* tutorial 2.1 ; triangle */
let n = 9;
0:n.collect { :i |
	let harmonicnumber = 2 * i + 1;
	let mult = (-1 ^ (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	SinOsc(440 * harmonicnumber, 0) * mult
}.Sum / n

/* tutorial 2.1 ; bell spectra */
let rat = [0.5 1 1.19 1.56 2 2.51 2.66 3.01 4.1];
let amp = [0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1] / 23;
SinOsc(500 * rat, 0).Sum * amp

/* tutorial 2.4 ; fm */
let modFreq = MouseX(1, 440, 1, 0.2);
let modIndex = MouseY(0.0, 10.0, 0, 0.2);
SinOsc(SinOsc(modFreq,0) * modFreq * modIndex + 440, 0) * 0.25

/* tutorial 2.4 ; fm */
let carFreq = 440;
let harmonicity = MouseX(0, 10, 0, 0.2).RoundTo(1);
let modIndex = MouseY(0.0, 10.0, 0, 0.2);
let modFreq = carFreq * harmonicity;
SinOsc(carFreq + (SinOsc(modFreq, 0) * modFreq * modIndex), 0.0) * 0.1

/* tutorial 2.4 ; pm */
let modFreq = MouseX(1,1000, 1, 0.2);
let modIndex = MouseY(0.0, 100.0, 0, 0.2);
let conversion = 2.pi / SampleRate();
let phase = Phasor(0, 440 * conversion, 0, 2.pi, 0) + (modFreq * modIndex * conversion * SinOsc(modFreq, 0));
SinOsc(0, phase) * 0.25

/* tutorial 2.4 ; pm ; equivalent */
let modFreq = MouseX(1,1000, 1, 0.2);
let modIndex = MouseY(0.0, 100.0, 0, 0.2);
let conversion = 2.pi / SampleRate();
SinOsc(440, (modFreq * modIndex * conversion * SinOsc(modFreq, 0))) * 0.25

/* tutorial 2.5 ; chorus */
Saw([440 443 437]).Sum * 0.1

/* tutorial 2.5 ; am, fm, chorus */
let src = Saw([440 443 437] + (SinOsc(100, 0) * 100));
let amp = LfSaw(Line(3, 17, 3),0) * 0.5 + 0.5 * Line(1, 0, 10);
Resonz(src, XLine(10000, 10, 10), Line(1, 0.05, 10)).Sum * amp

/* tutorial 2.5 ; bell patch ; requires=kr */
let spectrum = [0.5 1 1.19 1.56 2 2.51 2.66 3.01 4.1];
let amplitudes = [0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1];
let numPartials = spectrum.size;
let modFreqs1 = { Rand(1, 5) } ! numPartials;
let modFreqs2 = { Rand(0.1, 3) } ! numPartials;
let decayTimes = 1:numPartials.collect { :i |
	Rand(2.5, 2.5 + (5 * (1.0 - (i - 1 / numPartials))))
};
1:numPartials.collect { :i |
	let freq = spectrum[i] + (SinOsc(modFreqs1[i], 0) * 0.005) * 500;
	let amp = 0.1 * Line(
		1,
		0,
		decayTimes[i]
	) * (SinOsc(modFreqs2[i], 0) * 0.1 + 0.9 * amplitudes[i]);
	Pan2(SinOsc(freq, 0), Rand(-1, 1), amp)
}.Mix

/* tutorial 3.4 */
SinOsc(Stepper(Impulse(10, 0), 0, 1, 10, 1, 1) * 100, 0) * 0.1

/* tutorial 3.4 */
Saw(Select(Stepper(Impulse(4, 0.1), 0, 0, 7, 1, 0), [72, 63, 67, 72, 55, 62, 63, 60].MidiCps)) * 0.1

/* tutorial 3.4 */
Saw(
	Select(
		Stepper(Impulse(MouseX(1, 40, 0, 0.2), 0.1), 0, 0, 7, 1, 0),
		[72 63 67 72 55 62 63 60].MidiCps
	)
) * 0.1

/* tutorial 3.4 */
let source = SinOsc(10, 0);
PinkNoise() * 0.1 * [source, Trig1(source, 0.001)]

/* tutorial 3.4 */
SinOsc(300 + (200 * Latch(SinOsc(13.3, 0), Impulse(10, 0))), 0) * 0.2

/* tutorial 3.4 ; ? */
let env = Env([0 1 0 0.5 -0.4], [0.1], [0], nil, nil, 0).asList;
SinOsc(400 * (1 + EnvGen(Impulse(2.5, 0), 1, 0, 1, 0, env)), 0) * 0.1

/* tutorial 3.4 ; ? */
let env = Env([63 63 60 55 60], [0.125], [0], nil, nil, 0).asList;
SinOsc(EnvGen(Impulse(2, 0), 1, 0, 1, 0, env).MidiCps, 0) * 0.1

/* tutorial 3.4 */
let trig = Impulse(3, 0);
let sound = LfPulse(110 * [1, 5 / 2], 0, 0.5).Sum * 0.2;
let env = Decay2(trig, 0.02, 0.2);
Pan2(sound * env, 0, 1)

/* tutorial 3.4 ; ? */
let t = MouseY(0, 1, 0, 0.2) * [0 128 256 128] / SampleRate();
let e = Env([0 0 1 -1 0], t, [1], nil, nil, 0).asList;
EnvGen(Impulse(MouseX(10, 300, 1, 0.2), 0), 1, 0, 1, 0, e) * 0.2

/* tutorial 3.4 ; portamento/glide */
Saw(Lag(Stepper(Impulse(10, 0), 0, 1, 10, 1, 1) * 200, MouseX(0.0, 0.2, 0, 0.2))) * 0.1

/* tutorial 3.4 */
Ringz(Saw(LinExp(Lag(LfNoise0(5), 0.1), -1, 1, 100, 2000)) * 0.2, 1000, 0.01) * 0.1

/* tutorial 3.4 */
Ringz(Saw(LinExp(Lag(LfNoise0(5), MouseX(0.01, 0.3, 0, 0.2)), -1, 1, 100, 2000).RoundTo(20)) * 0.2, 1000, 0.01) * 0.1

