/* tChoose ; tBufChoose */
let tr = impulse(5, 0);
let mnn = tChoose(tr, [48 60] +.x [0 2 4 5 7 9 11]);
(sinOsc([48, mnn, 72].midiCps.lag(0.1), 0) * [1, 2, 1]).splay2 / 17
