/* http://earslap.com/article/combination-tones-and-the-nonlinearities-of-the-human-ear.html */
let timesBase = ([1] # 12) ++ [1.5 0.5 2];
let times = dseq(Infinity, (timesBase ++ timesBase) / 2);
let pitchBase = [55 55 56 58 58 56 55 53 51 51 53 55];
let pitches = dseq(Infinity, (pitchBase ++ [55 53 53] ++ pitchBase ++ [53 51 51]).midiCps);
let freqs = duty(times, 0, pitches);
let baseRandFreq = tRand(1000, 2000, impulse(32, 0)).lag(0.01);
sinOsc([baseRandFreq, baseRandFreq + freqs], 0).mean
