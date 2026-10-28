/* https://scsynth.org/t/insect-ambience/94/ (dcm) ; backgrdhiss ; requires=kr */
{
	hpf(crackle(1.96), 900) * vibrato(50.0, 1, 0.02, 0, 0, 0.04, 0.1, 0, 0).kr * 0.0001
} ! 2

/* bugs */
let amp = 1.2; let ampLagTime = 20; let cutFreq = 600; let nse = 0.1; let nFreq = 800;
let src = { lpf(pinkNoise() * nse, nFreq) * sinOsc(1750, 0) * sinOsc(160, 0) } ! 2;
let bugs = pitchShift(src, 0.2, linLin(lfTri(20, 0), -1, 1, 0.9, 5), 0.01, 0.0001);
hpf(limiter(bugs, 0.9, 0.01) * line(0, amp, ampLagTime), cutFreq)

/* frog */
blip([10.001,10], 200) * lfPulse(0.1, 0, 0.5) * 0.02

/* thestart (modified) */
let amp = 0.2; let ampLagTime = 5; let freq = 1000; let pos = 1; let posLagTime = 30;
let src = {
	hpf(
		bpf(pinkNoise() * line(0, amp, ampLagTime), [450, 250, 150], 0.2),
		linLin(lfNoise2([0.1, 0.11, 0.14]), -1, 1, 100,800)
	)
} !+ 3;
xFade2(src.splay, lpf(src, freq), line(0, pos, posLagTime), 1)

/* StaticLoss ; requries=WaveLoss */
let amp = 1; let freq = 1200; let rq = 1; let db = -45; let gate = 1; let pan = -0.5;
let src = waveLoss(pinkNoise() * 0.1, 39, 40, 1);
pan2(bPeakEq(src, freq, rq, db), pan, amp)

/* Storm ; very slow fade-in */
let amp = 0.2; let ampLagTime = 102; let cut = 165; let hicut = 440;
let src = { rlpf(crackle(1.9 + rand(0, 0.05)), cut, 1) } !+ 6;
src = hpf(leakDc(decay2(src, 0.01, 0.1), 0.995), hicut);
pan2(limiter(src, 0.9, 0.1), 0, line(0, amp, ampLagTime))

/* Rumble ; very slow fade-in */
let amp = 0.2; let lagTime = 120; let freq = 240; let frq = 490;
let src = leakDc(decay2(clipNoise() * 0.2, 0.01, 0.1), 0.995);
pan2(leakDc(lpf(rlpf(src, freq, 1), frq), 0.995), 0, line(0, amp, lagTime))
