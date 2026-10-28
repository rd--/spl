/* Analog bubbles (Jmcc) */
let f = lfSaw(0.4, 0).*+(
	24,
	lfSaw([8, 7.23], 0).*+(3, 80)
).midiCps; /* Glissando function */
combN(sinOsc(f, 0) * 0.05, 0.2, 0.2, 4) /* Echoing sine wave */
