(* Multiplexer (ie. Select) ; identity *)
let numChannels = 4;
let tr = Impulse(4, 0);
let selector = TiRand(0, numChannels - 1, tr);
let env = Decay2(tr, 1 / 11, 1 / 3) / 5;
let inputArray = SinOsc({ Rand(48, 72).MidiCps } ! numChannels, 0) * env;
let signalA = Multiplexer(selector, inputArray);
let signalB = Select(selector, inputArray);
let signalC = Demultiplexer(numChannels, signalA, selector).Sum;
[signalA, signalB, signalC].Splay2

(* Multiplexer ; array expansion at first input *)
let m = [0 2 3 5 7 9] + 48;
let k = m.size + 1;
let x = MouseX(0, k, 0, 0.2);
let y = MouseY(0, k, 0, 0.2);
SinOsc(Multiplexer([x, y], m).MidiCps, 0) * 0.1
