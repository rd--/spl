/* http://sccode.org/1-Z (jl) ; requires=kr */
let a = lag(impulse(8, 0), 0.1).kr;
let b = crackle(lag(lfSaw(3, 0).abs, 0.1).kr * 1.8);
let c = a * b;
let d = lag(impulse(2, 0) + impulse(4, 0.5), 0.1).kr;
let e = blip(4.9, 7) * 0.4;
let f = d * e;
(c + gVerb(f, 1, 1, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 5).tanh * 0.25
