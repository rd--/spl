(* LocalOut ; resonator, must subtract blockSize for correct tuning *)
let p = LocalIn(1, 0);
let i = Impulse(1, 0);
let d = DelayC(i + (p * 0.995), 1, 440.reciprocal - ControlDur());
[p <! LocalOut(d), SinOsc(440, 0) * 0.05]

(* LocalOut ; ping pong *)
let n = Decay(Impulse(0.3, 0), 0.1) * PinkNoise() * 0.2;
let l = LocalIn(2, 0) + [n, 0];
let d = DelayN(l, 0.2, 0.2);
d <! LocalOut(d.reversed * 0.8)
