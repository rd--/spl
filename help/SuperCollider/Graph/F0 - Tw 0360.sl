{- http://sccode.org/1-4Qy (F0) ; 0360 -}
let t = SinOsc([7.992, 8], 0);
let e = Perc(t, 0.005, 0.2, -4);
let f = [1, 2].collect { :i |
	let q = [
		Dseq(240, '@BGIJB@IGBJI'.ascii.asArray),
		Dseq(120, '@LEGJLEG'.ascii.asArray),
		Dseq(60, 'EGJL'.ascii.asArray)
	];
	Demand(t[i], 0, Dseq(1, q)).MidiCps
};
let x = SinOsc(f, SinOsc(1 / [12, 9], 0) / 4 + 1 * SinOsc(f, e * pi)) * e / 2;
FreeVerb2(x[1], x[2], 0.1, 1, 0)

{- ---- calculations ----

	'@BGIJB@IGBJI'.ascii.asArray == [64 66 71 73 74 66 64 73 71 66 74 73]
	'@LEGJLEG'.ascii.asArray == [64 76 69 71 74 76 69 71]
	'EGJL'.ascii.asArray == [69 71 74 76]

-}
