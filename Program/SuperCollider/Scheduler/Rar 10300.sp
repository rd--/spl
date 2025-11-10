/* https://scsynth.org/t/10300 (Ryan Alexander Alam) */
let k = 13;
let f0 = 48.MidiCps;
let scales = (1 .. k).collect { :i |
	(0 .. 2 * i + 1).collect { :j |
		Fraction(i + 1L, i) ^ j
	}
};
let durations = scales.collect { :each |
	((each.size - 1) # [0.25]) ++ [1]
};
UgenGraph(
	'saw',
	2 # [
		Saw(
			NamedControl('freq', 440)
		) * Cutoff(
			0,
			4.8,
			-20
		) * 0.2
	]
).send;
LsBind(
	instrument: 'saw',
	freq: LsCat(scales.++ * f0),
	dur: LsCat(durations.++)
)
