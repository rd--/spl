/* Harmonic tumbling (Jmcc) */
let f = 80; /* Fundamental frequency */
let p = 10; /* Number of partials per channel */
let z = 0.0; /* Start of oscillator daisy chain */
let trig = xLine([10, 10], 0.1, 60); /* Trigger probability decreases over time */
[1 .. p].do { :i |
	z := fSinOsc(
		f * i, /* Frequency of partial */
		0
	).*+(
		decay2(
			dust(
				trig /* Trigger rate */
			) * 0.02, /* Trigger amplitude */
			0.005, /* Grain attack time */
			rand(0, 0.5) /* Grain decay time */
		),
		z
	)
};
z
