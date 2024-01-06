(* Demultiplexer ; sums to identity *)
let tr = Impulse(4, 0);
let input = SinOsc(440, 0);
let numChannels = 4;
let selector = TiRand(0, numChannels - 1, tr);
Demultiplexer(numChannels, input, selector).Sum * 0.1

(* Demultiplexer *)
let tr = Impulse(4, 0);
let freq = TiRand(48, 72, tr).MidiCps;
let env = Decay2(tr, 1 / 13, 1 / 2) * 0.5;
let input = SinOsc(freq, 0) * env;
let numChannels = 4;
let selector = TiRand(0, numChannels - 1, tr);
Demultiplexer(numChannels, input, selector).Splay2
