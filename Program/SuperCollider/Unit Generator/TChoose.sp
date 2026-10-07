/* TChoose ; select input at trigger */
let x = MouseX(1, 1000, 1, 0.1);
let t = Dust(x);
let f = TiRand(48, 60, t).MidiCps;
let o = TChoose(t, [SinOsc(f, 0), Saw(f * 2), Pulse(f * 0.5, 0.1)]);
o * 0.1

/* TChoose ; sequences of different lengths */
let a = [1 2 3; 1 2 3 4 5; 1 2 3 4 5 6 7];
let t1 = Impulse(1 / 5, 0);
let t2 = Impulse(5, 0);
let m = TChoose(t1, a.collect { :x | Demand(t2, 0, Dseq(Infinity, x)) });
let c = SinOsc(1200, 0) * Decay(t1, 1) * 0.1;
SinOsc(m * 110, 0) * 0.1 + c
