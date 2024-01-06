(* Line *)
SinOsc([110, Line(110, 440, 100)], 0) * 0.1

(* Line *)
SinOsc(Line(200, 17000, 5), 0) * 0.1

(* Line *)
SinOsc(Line(200, [209, 211], 5), 0) * 0.1

(* Line *)
let octaves = 12 * (5 .. 7);
octaves.collect { :m0 |
	let m1 = m0 + [0, 4.078, 7.019, 11.097];
	let m2 = m0 + [0, 4.980, 7.921, 10.863];
	let du = 90;
	let o = (1 .. 4).collect { :index |
		EqPan2(
			SinOsc(Line(m1[index], m2[index], du).MidiCps, 0),
			Line(1.Rand2, 1.Rand2, du)
		) * Line(0.1.Rand0, 0.1.Rand0, du)
	};
	o.Sum
}.Mix * 0.2

(* Line ; note Line is an existing class in Squeak *)
let f = Line(200, 17000, 5);
SinOsc(f, 0) * 0.05

(* ---- PrimitiveLine ; with doneAction ; self deleting *)
let a = PrimitiveLine(0.1, 0, 1, 2);
SinOsc(440, 0) * a
