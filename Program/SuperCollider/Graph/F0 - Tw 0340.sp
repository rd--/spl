/* http://sccode.org/1-4Qy (F0) ; 0340 ; requires=demand */
let c = sinOscFb(1 / [12 8], 0) + 3 / 24;
let m = duty(c, 0, dseq(Infinity, [0 8 5 1 5 4 5] * (c * 18).round(1))) + 60;
allpassN(sinOscFb(m.midiCps, c * 2), 0.2, 0.2, 1) / 2
