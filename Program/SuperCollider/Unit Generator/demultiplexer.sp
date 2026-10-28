/* Demultiplexer ; sums to identity */
let tr = impulse(4, 0);
let input = sinOsc(440, 0);
let numChannels = 4;
let selector = tiRand(0, numChannels - 1, tr);
demultiplexer(numChannels, input, selector).sum * 0.1

/* Demultiplexer */
let tr = impulse(4, 0);
let freq = tiRand(48, 72, tr).midiCps;
let env = decay2(tr, 1 / 13, 1 / 2) * 0.5;
let input = sinOsc(freq, 0) * env;
let numChannels = 4;
let selector = tiRand(0, numChannels - 1, tr);
demultiplexer(numChannels, input, selector).splay2
