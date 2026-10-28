/* requires=kr ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html */
let n = 11;
let z = {
	let freq = rand(50, 560.3);
	let numCps = rand(2, 20);
	let kNum = sinOsc(expRand(0.02, 0.2), 0).*+(numCps / 2, numCps / 2);
	let osc = gendy1(
		rand(0, 6),
		rand(0, 6),
		rand(0, 1),
		rand(0, 1),
		freq,
		freq,
		rand(0, 1),
		rand(0, 1),
		numCps,
		kNum.kr
	);
	pan2(osc, rand(-1, 1), 0.5 / n.sqrt)
} !> n;
resonz(z, mouseX(100, 2000, 0, 0.2), mouseY(0.01, 1.0, 0, 0.2))

/* tutorial 2.1 ; sawtooth */
let n = 9;
[0 .. n].collect { :i |
	let mult = (-1 ^ i) * (0.5 / (i + 1));
	sinOsc(440 * (i + 1), 0) * mult
}.sum / n

/* tutorial 2.1 ; square */
let n = 9;
[0 .. n].collect { :i |
	let harmonicnumber = 2 * i + 1;
	sinOsc(440 * harmonicnumber, 0) / harmonicnumber
}.sum / n

/* tutorial 2.1 ; triangle */
let n = 9;
[0 .. n].collect { :i |
	let harmonicnumber = 2 * i + 1;
	let mult = (-1 ^ (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	sinOsc(440 * harmonicnumber, 0) * mult
}.sum / n

/* tutorial 2.1 ; bell spectra */
let rat = [0.5 1 1.19 1.56 2 2.51 2.66 3.01 4.1];
let amp = [0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1] / 23;
sinOsc(500 * rat, 0).sum * amp

/* tutorial 2.4 ; fm */
let modFreq = mouseX(1, 440, 1, 0.2);
let modIndex = mouseY(0.0, 10.0, 0, 0.2);
sinOsc(sinOsc(modFreq,0) * modFreq * modIndex + 440, 0) * 0.25

/* tutorial 2.4 ; fm */
let carFreq = 440;
let harmonicity = mouseX(0, 10, 0, 0.2).round(1);
let modIndex = mouseY(0.0, 10.0, 0, 0.2);
let modFreq = carFreq * harmonicity;
sinOsc(carFreq + (sinOsc(modFreq, 0) * modFreq * modIndex), 0.0) * 0.1

/* tutorial 2.4 ; pm */
let modFreq = mouseX(1,1000, 1, 0.2);
let modIndex = mouseY(0.0, 100.0, 0, 0.2);
let conversion = 2.pi / sampleRate();
let phase = phasor(0, 440 * conversion, 0, 2.pi, 0) + (modFreq * modIndex * conversion * sinOsc(modFreq, 0));
sinOsc(0, phase) * 0.25

/* tutorial 2.4 ; pm ; equivalent */
let modFreq = mouseX(1,1000, 1, 0.2);
let modIndex = mouseY(0.0, 100.0, 0, 0.2);
let conversion = 2.pi / sampleRate();
sinOsc(440, (modFreq * modIndex * conversion * sinOsc(modFreq, 0))) * 0.25

/* tutorial 2.5 ; chorus */
saw([440 443 437]).sum * 0.1

/* tutorial 2.5 ; am, fm, chorus */
let src = saw([440 443 437] + (sinOsc(100, 0) * 100));
let amp = lfSaw(line(3, 17, 3),0) * 0.5 + 0.5 * line(1, 0, 10);
resonz(src, xLine(10000, 10, 10), line(1, 0.05, 10)).sum * amp

/* tutorial 2.5 ; bell patch ; requires=kr */
let spectrum = [0.5 1 1.19 1.56 2 2.51 2.66 3.01 4.1];
let amplitudes = [0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1];
let numPartials = spectrum.size;
let modFreqs1 = { rand(1, 5) } ! numPartials;
let modFreqs2 = { rand(0.1, 3) } ! numPartials;
let decayTimes = [1 .. numPartials].collect { :i |
	rand(2.5, 2.5 + (5 * (1.0 - (i - 1 / numPartials))))
};
[1 .. numPartials].collect { :i |
	let freq = spectrum[i] + (sinOsc(modFreqs1[i], 0) * 0.005) * 500;
	let amp = 0.1 * line(
		1,
		0,
		decayTimes[i]
	) * (sinOsc(modFreqs2[i], 0) * 0.1 + 0.9 * amplitudes[i]);
	pan2(sinOsc(freq, 0), rand(-1, 1), amp)
}.mix

/* tutorial 3.4 */
sinOsc(stepper(impulse(10, 0), 0, 1, 10, 1, 1) * 100, 0) * 0.1

/* tutorial 3.4 */
saw(selectT(stepper(impulse(4, 0.1), 0, 0, 7, 1, 0), [72, 63, 67, 72, 55, 62, 63, 60].midiCps)) * 0.1

/* tutorial 3.4 */
saw(
	selectT(
		stepper(impulse(mouseX(1, 40, 0, 0.2), 0.1), 0, 0, 7, 1, 0),
		[72 63 67 72 55 62 63 60].midiCps
	)
) * 0.1

/* tutorial 3.4 */
let source = sinOsc(10, 0);
pinkNoise() * 0.1 * [source, trig1(source, 0.001)]

/* tutorial 3.4 */
sinOsc(300 + (200 * latch(sinOsc(13.3, 0), impulse(10, 0))), 0) * 0.2

/* tutorial 3.4 ; ? */
let env = Env([0 1 0 0.5 -0.4], [0.1], [0], nil, nil, 0);
sinOsc(400 * (1 + envGen(impulse(2.5, 0), 1, 0, 1, 0, env)), 0) * 0.1

/* tutorial 3.4 ; ? */
let env = Env([63 63 60 55 60], [0.125], [0], nil, nil, 0);
sinOsc(envGen(impulse(2, 0), 1, 0, 1, 0, env).midiCps, 0) * 0.1

/* tutorial 3.4 */
let trig = impulse(3, 0);
let sound = lfPulse(110 * [1, 5 / 2], 0, 0.5).sum * 0.2;
let env = decay2(trig, 0.02, 0.2);
pan2(sound * env, 0, 1)

/* tutorial 3.4 ; ? */
let t = mouseY(0, 1, 0, 0.2) * [0 128 256 128] / sampleRate();
let e = Env([0 0 1 -1 0], t, [1], nil, nil, 0);
envGen(impulse(mouseX(10, 300, 1, 0.2), 0), 1, 0, 1, 0, e) * 0.2

/* tutorial 3.4 ; portamento/glide */
saw(lag(stepper(impulse(10, 0), 0, 1, 10, 1, 1) * 200, mouseX(0.0, 0.2, 0, 0.2))) * 0.1

/* tutorial 3.4 */
ringz(saw(linExp(lag(lfNoise0(5), 0.1), -1, 1, 100, 2000)) * 0.2, 1000, 0.01) * 0.1

/* tutorial 3.4 */
ringz(saw(linExp(lag(lfNoise0(5), mouseX(0.01, 0.3, 0, 0.2)), -1, 1, 100, 2000).round(20)) * 0.2, 1000, 0.01) * 0.1
