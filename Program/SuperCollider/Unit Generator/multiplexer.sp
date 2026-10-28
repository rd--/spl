/* Multiplexer (ie. selectT) ; identity */
let numChannels = 4;
let tr = impulse(4, 0);
let selector = tiRand(0, numChannels - 1, tr);
let env = decay2(tr, 1 / 11, 1 / 3) / 5;
let inputList = sinOsc({ rand(48, 72).midiCps } ! numChannels, 0) * env;
let signalA = multiplexer(selector, inputList);
let signalB = selectT(selector, inputList);
let signalC = demultiplexer(numChannels, signalA, selector).sum;
[signalA, signalB, signalC].splay2

/* Multiplexer ; list expansion at first input */
let m = [0 2 3 5 7 9] + 48;
let k = m.size + 1;
let x = mouseX(0, k, 0, 0.2);
let y = mouseY(0, k, 0, 0.2);
sinOsc(multiplexer([x, y], m).midiCps, 0) * 0.1
