/* http://sccode.org/1-9 (jl) */
let n = 956;
let a = hpf(pinkNoise() * 0.005, 10) * line(0, 1, 9);
let z = [1 .. 99].collect { :i |
	ringz(a * lfNoise1(0.05 + rand(0, 0.1)), 55 * (i + n) + 60, 0.2)
};
gVerb(z.sum, 70, 990, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).tanh
