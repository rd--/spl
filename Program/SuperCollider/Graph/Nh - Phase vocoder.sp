/* Phase vocoder (nh) ; http://scsynth.org/t/old-school-vocoders/5198/6 ; warning: audioIn ; requires=kr */
let src = audioIn([1]);
let notes = { tChoose(dust(0.5).kr, 60 + [-9, -7, -5, -3, -2, 0, 2, 3, 5, 7, 9, 10]) } ! 3;
let numBands = 32;
let bandFreqs = linExp([0 .. numBands - 1], 0, numBands - 1, 100, 8000);
let voicedCarrier = saw(notes.midiCps);
let isVoiced = lag(lag(zeroCrossing(src).cpsMidi, 0.05) > 5000.cpsMidi, 0.05);
let carrier = selectX(isVoiced, [voicedCarrier, pinkNoise()]);
let filterQ = tRand(10, 100, dust(0.5));
let srcAmp = amplitudeFollower(bpf(src, bandFreqs, 1 / filterQ), 0.01, 0.05);
let snd = bpf(carrier, bandFreqs, 0.05) * srcAmp;
eqPan2(snd.sum, 0) * numBands / 4
