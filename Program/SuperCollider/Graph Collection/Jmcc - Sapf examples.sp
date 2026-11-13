/* lots of sine lfos ; jmcc */
let expLfo = { :freq :phase :low :high |
	sinOsc(freq, phase)
	.linExp(-1, 1, low, high)
};
expLfo(0.027, 0, 0.05, 0.2)
.expLfo(0, 40, 4000)
.+([-0.2, 0.2])
.saw
.rlpf(
	expLfo(0.17, 0, 100, 6000),
	0.1
).*(
	expLfo(0.041, 0, 2, 20)
	.sinOsc([0, 0.25])
	.linLin(-1, 1, 0, 1)
).combN(0.3, 0.3, 3)
.*(0.1)

/* harmonic clouds ; jmcc */
let lpf2 = { :x :f |
	lpf(lpf(x, f), f)
};
{ :tr |
	let f = tExpRand(64, 4000, tr).round(64);
	saw(f + tRand(-1, 1, [tr tr]))
	.lpf2(f * tRand(1, 6, tr))
	.*(0.04)
}.overlapTexture(8, 0.4, 8 / 0.4).sum

/* absolute value distortion ; jmcc */
let a = sinOsc(100, 0);
let b = sinOsc(0.2, 0).linLin(-1, 1, 0, 1);
let c = ((a + b).abs - b).*(0.2);
[c c]
