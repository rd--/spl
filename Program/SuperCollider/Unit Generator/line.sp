/* Line */
SinOsc([110, line(110, 440, 100)], 0) * 0.1

/* Line */
SinOsc(line(200, 17000, 5), 0) * 0.1

/* Line */
SinOsc(line(200, [209, 211], 5), 0) * 0.1

/* Line */
let octaves = 12 * [5 .. 7];
octaves.collect { :m0 |
	let m1 = m0 + [0, 4.078, 7.019, 11.097];
	let m2 = m0 + [0, 4.980, 7.921, 10.863];
	let du = 90;
	let o = [1 .. 4].collect { :index |
		EqPan2(
			SinOsc(line(m1[index], m2[index], du).midiCps, 0),
			line(Rand(-1, 1), Rand(-1, 1), du)
		) * line(Rand(0, 0.1), Rand(0, 0.1), du)
	};
	o.sum
}.Mix * 0.2

/* Line ; note Line is an existing class in Squeak */
let f = line(200, 17000, 5);
SinOsc(f, 0) * 0.05
