{- PlayBuf ; requires=SfAcquire -}
let sf = SfAcquireStereo('piano-c5');
PlayBuf(1, sf, SfRateScale(sf), 1, 0, 1, 0) * 0.5

{- PlayBuf ; normal playback at same speed of recording -}
let sf = SfAcquireMono('floating_1');
PlayBuf(1, sf, 1, 0, 0, 1, 0) * 0.25

{- PlayBuf ; accelerating pitch -}
let sf = SfAcquireMono('floating_1');
let rate = XLine(0.1, 100, 60);
PlayBuf(1, sf, rate, 0, 0, 1, 0) * 0.25

{- PlayBuf ; sine wave control of playback rate ; negative rate plays backwards -}
let sf = SfAcquireMono('floating_1');
let rate = SinOsc(XLine(0.2, 8, 30), 0) * 2 + 0.1;
PlayBuf(1, sf, rate, 0, 0, 1, 0) * 0.25

{- PlayBuf ; modulate the frequency of a SinOsc with a sample (adc) -}
let soundFile = SfAcquireMono('floating_1');
let sampleLoop = PlayBuf(1, soundFile, 0.5, 0, 0, 1, 0);
SinOsc([100, 150] + (sampleLoop * MouseX(0, 1400, 0, 0.1)), 0) * MouseY(0.2, 0.0002, 0, 0.2)

{- PlayBuf ; modulate frequency and amplitude of a SinOsc with a sample (adc) -}
let soundFile = SfAcquireMono('floating_1');
let sampleLoop = PlayBuf(1, soundFile, 0.5, 0, 0, 1, 0);
let ampMod = (sampleLoop * MouseY(0, 1, 0, 0.2)) + MouseY(1, 0, 0, 0.2);
SinOsc([100 150] + (sampleLoop * MouseX(0, 1400, 0, 0.1)), 0) * ampMod * 0.2

{- PlayBuf ; modulate phase and amplitude of a SinOsc with a sample (adc) -}
let soundFile = SfAcquireMono('floating_1');
let sampleLoop = PlayBuf(1, soundFile, 0.5, 0, 0, 1, 0);
let ampMod = (sampleLoop * MouseY(0, 1, 0, 0.2)) + MouseY(1, 0, 0, 0.2);
SinOsc([100 149.8], sampleLoop * MouseX(0, 7, 0, 0.1)) * ampMod * 0.2

{- PlayBuf ; shuffler ; requires=TrigAllocator -}
let trigger = Dust(256);
let dur = TRand(0.05, 0.15, trigger);
let w = TrigAllocator(64, 1, trigger, dur);
let numChannels = 1;
let soundFile = SfAcquireMono('floating_1');
let rate = MouseY(0.5, 2, 0, 0.2) + TRand(-0.05, 0.05, w);
let startPos = MouseX(0, BufFrames(soundFile), 0, 0.2) + TRand(-0.025, 0.025, w);
let env = Sine(w, dur) / 5;
EqPan(
	PlayBuf(numChannels, soundFile, rate, w, startPos, 1, 0) * env,
	MouseX(-0.75, 0.75, 0, 0.2) + TRand(-0.25, 0.25, w)
).Sum
