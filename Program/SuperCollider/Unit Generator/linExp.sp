/* linExp */
let mod = sinOsc(line(1, 10, 10), 0);
[sinOsc(mod * 400 + 500, 0), sinOsc(linExp(mod, -1, 1, 100, 900), 0)] * 0.1

/* linExp */
let s = lfSaw(0.25, 1);
sinOsc(linExp(s + 1, 0, 2, 220, 440), 0) * 0.1

/* linExp ; mce */
let s = [lfSaw(1 / 4, 1), sinOsc(1 / 3, (1 / 2).pi)];
sinOsc(linExp(s + 1, 0, 2, 220, 440), 0) * 0.1

/* linExp */
let tr = dust(2 / [3, 5]);
let note = tRand(48, 72, tr);
let freq = lag(note.midiCps, 0.05);
let env = decay2(tr, 0.005, tRand(0.1, 0.9, tr)) * 0.2;
let lfo = linExp(sinOsc(0.12, 0), -1, 1, 300, 8000);
let snd = lfSaw(freq + [0, 1], 0);
2.timesRepeat {
	snd := rlpf(snd, lfo, 0.2).softClip
};
snd * env
