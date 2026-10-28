/* playBuf ; requires=SfAcquire */
let sf = sfAcquireStereo('PianoC5');
playBuf(1, sf, sfRateScale(sf), 1, 0, 1, 0) * 0.5

/* playBuf ; normal playback at same speed of recording */
let sf = sfAcquireMono('Floating');
playBuf(1, sf, 1, 0, 0, 1, 0) * 0.25

/* playBuf ; accelerating pitch */
let sf = sfAcquireMono('Floating');
let rate = xLine(0.1, 100, 60);
playBuf(1, sf, rate, 0, 0, 1, 0) * 0.25

/* playBuf ; sine wave control of playback rate ; negative rate plays backwards */
let sf = sfAcquireMono('Floating');
let rate = sinOsc(xLine(0.2, 8, 30), 0) * 2 + 0.1;
playBuf(1, sf, rate, 0, 0, 1, 0) * 0.25

/* playBuf ; modulate the frequency of a sinOsc with a sample (adc) */
let soundFile = sfAcquireMono('Floating');
let sampleLoop = playBuf(1, soundFile, 0.5, 0, 0, 1, 0);
sinOsc([100, 150] + (sampleLoop * mouseX(0, 1400, 0, 0.1)), 0) * mouseY(0.2, 0.0002, 0, 0.2)

/* playBuf ; modulate frequency and amplitude of a sinOsc with a sample (adc) */
let soundFile = sfAcquireMono('Floating');
let sampleLoop = playBuf(1, soundFile, 0.5, 0, 0, 1, 0);
let ampMod = (sampleLoop * mouseY(0, 1, 0, 0.2)) + mouseY(1, 0, 0, 0.2);
sinOsc([100 150] + (sampleLoop * mouseX(0, 1400, 0, 0.1)), 0) * ampMod * 0.2

/* playBuf ; modulate phase and amplitude of a sinOsc with a sample (adc) */
let soundFile = sfAcquireMono('Floating');
let sampleLoop = playBuf(1, soundFile, 0.5, 0, 0, 1, 0);
let ampMod = (sampleLoop * mouseY(0, 1, 0, 0.2)) + mouseY(1, 0, 0, 0.2);
sinOsc([100 149.8], sampleLoop * mouseX(0, 7, 0, 0.1)) * ampMod * 0.2

/* playBuf ; shuffler ; requires=TrigAllocator */
let trigger = dust(256);
let dur = tRand(0.05, 0.15, trigger);
let w = trigAllocator(64, 1, trigger, dur);
let numChannels = 1;
let soundFile = sfAcquireMono('Floating');
let rate = mouseY(0.5, 2, 0, 0.2) + tRand(-0.05, 0.05, w);
let startPos = mouseX(0, bufFrames(soundFile), 0, 0.2) + tRand(-0.025, 0.025, w);
let env = sine(w, dur) / 5;
eqPan(
	playBuf(numChannels, soundFile, rate, w, startPos, 1, 0) * env,
	mouseX(-0.75, 0.75, 0, 0.2) + tRand(-0.25, 0.25, w)
).sum
