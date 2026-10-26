/* bitwise (jl) - a0f253ff89f6b244ea29a1e431dd9e5df5571a8b (jonatan liljedahl) ; abstracted */
let t = PulseCount(Impulse(8000, 0), 0);
let b = [15 -> 5, 5 -> [3, 4], 2 -> 9, 8 -> 11].collect { :p |
	(t * p.key).bitAnd(t.bitShiftRight(p.value))
};
let s = b.reduce { :j :i |
	i.bitOr(j)
} - 3;
Hpf(((s % 256 / 127) - 1) * 3, 20).tanh * 0.02

/* http://sccode.org/1-Z (jl) ; edits (rd) */
let t = 0.0025;
let a = Lag(Trig(Impulse(8, 0), t * 2), 0.1);
let b = Crackle(Lag(LfSaw(3, 0).abs, 0.1) * 1.8);
let c = a * b;
let d = Lag(Trig(Impulse(2, 0) + Impulse(4, 0.5), t), 0.1);
let e = Blip(4.9, 7) * 0.4;
let f = d * e;
(c + GVerb(f, 1, 1, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 5).tanh * 0.25
