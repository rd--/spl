/* linExp */
let mod = SinOsc(line(1, 10, 10), 0);
[SinOsc(mod * 400 + 500, 0), SinOsc(linExp(mod, -1, 1, 100, 900), 0)] * 0.1

/* linExp */
let s = LfSaw(0.25, 1);
SinOsc(linExp(s + 1, 0, 2, 220, 440), 0) * 0.1

/* linExp ; mce */
let s = [LfSaw(1 / 4, 1), SinOsc(1 / 3, (1 / 2).pi)];
SinOsc(linExp(s + 1, 0, 2, 220, 440), 0) * 0.1

/* linExp */
let tr = Dust(2 / [3, 5]);
let note = TRand(48, 72, tr);
let freq = Lag(note.midiCps, 0.05);
let env = Decay2(tr, 0.005, TRand(0.1, 0.9, tr)) * 0.2;
let lfo = linExp(SinOsc(0.12, 0), -1, 1, 300, 8000);
let snd = LfSaw(freq + [0, 1], 0);
2.timesRepeat {
	snd := Rlpf(snd, lfo, 0.2).softClip
};
snd * env
