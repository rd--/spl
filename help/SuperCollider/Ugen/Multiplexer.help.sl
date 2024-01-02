(* Multiplexer (ie. Select) ; identity *)
var numChannels = 4;
var tr = Impulse(4, 0);
var selector = TiRand(0, numChannels - 1, tr);
var env = Decay2(tr, 1 / 11, 1 / 3) / 5;
var inputArray = SinOsc({ Rand(48, 72).MidiCps } ! numChannels, 0) * env;
var signalA = Multiplexer(selector, inputArray);
var signalB = Select(selector, inputArray);
var signalC = Demultiplexer(numChannels, signalA, selector).Sum;
[signalA, signalB, signalC].Splay2

(* Multiplexer ; array expansion at first input *)
var m = [0 2 3 5 7 9] + 48;
var k = m.size + 1;
var x = MouseX(0, k, 0, 0.2);
var y = MouseY(0, k, 0, 0.2);
SinOsc(Multiplexer([x, y], m).MidiCps, 0) * 0.1
