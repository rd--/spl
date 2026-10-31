/* https://scsynth.org/t/10300 (Ryan Alexander Alam) */
let k = 13;
let f0 = 48.midiCps;
let scales = [1 .. k].collect { :i |
	[0 .. 2 * i + 1].collect { :j |
		Fraction(i + 1, i) ^ j
	}
};
let durations = scales.collect { :each |
	([0.25] # (each.size - 1)) ++ [1]
};
UgenGraph(
	'saw',
	[
		saw(
			namedControl('freq', 440)
		) * cutoff(
			0,
			4.8,
			-20
		) * 0.2
	] # 2
).send;
lsBind(
	(
		instrument: 'saw',
		freq: lsCat(scales.++ * f0),
		dur: lsCat(durations.++)
	)
)
