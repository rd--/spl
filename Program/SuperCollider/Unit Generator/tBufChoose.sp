/* tBufChoose ; audio rate */
let tr = impulse(4, 0);
let nt = tBufChoose(tr, [0 2 4 5 7 9 11].localBuf);
sinOsc((48 + nt).midiCps.lag(0.1), 0) * 0.1

/* tBufChoose ; control rate */
let tr = impulse(4, 0).kr;
let nt = tBufChoose(tr, [0 2 4 5 7 9 11].localBuf);
sinOsc((48 + nt).midiCps.lag(0.1), 0) * 0.1

/* tBufChoose ; expansion */
let tr = impulse(4, 0);
let nt = tBufChoose(tr, [0 2 4 5; 7 9 11].localBuf);
sinOsc((48 + nt).midiCps.lag(0.1), 0) * 0.1
