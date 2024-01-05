(* Noise modulated sines ; Jmcc ; #6 *)
{
	var f = (60 + 40.Rand0).MidiCps;
	var z = SinOsc([f, f + 0.2], 0) * LfNoise2(f * [0.15, 0.16]) * 0.1;
	CombN(z, 0.3, 0.3, 4) + z.reversed
}.overlap(4, 4, 4)
