/* Forest sounds (Pj) */
{
	let n1 = brownNoise();
	let n2 = lfNoise2(50);
	let o = sinOsc(n2 * 50 + 50, 0) * 100 + 2000;
	bpf(n1, o, 0.001) * 10
} ! 2
