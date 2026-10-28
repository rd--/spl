/* Notes:

Not implemented

/* ---- Sw ; switch ; turn oscillator on and off ; requires=Sw */
[1 .. 8].collect { :i | sinOsc(110 * i, 0) * Sw(i) * 0.1 }.splay2

/* Sw ; switch ; turn oscillator (with amplitude lfo) on and off */
[1 .. 8].collect { :i | sinOsc(110 * i, 0) * Sw(i) * sinOsc(0.05, i.pi / 4) * 0.1 }.splay2

/* Sw ; switch ; switch is gate */
[1 .. 8].collect { :i | sinOsc(110 * i, 0) * asr(Sw(i), 0.01, 1, -4) * 0.1 }.splay2

/* Sw ; switch ; switch is trigger */
[1 .. 8].collect { :i | sinOsc(110 * i, 0) * decay(trig(Sw(i), 0.001), 1) * 0.1 }.splay2

*/
