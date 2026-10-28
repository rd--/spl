/* delayMap - one second delay at quarter gain */
let b = localBuf(1, 2 * 48000).zeroBuf;
let a = [
	-1 0 0 0.5
	1 -1 0 1
];
let x = mouseX(110, 440, 0, 0.1);
let y = mouseY(0.0, 0.2, 0, 0.1);
let o = sinOsc(x, 0) * y;
[delayMap(b, o, 0, a), o]

/* delayMap ; Event control */
Voicer(1, 16) { :e |
	let b = localBuf(1, 2 * 48000).zeroBuf;
	let a = [
		-1 e.y 0 0.5
		1.5 -1 0 1
	];
	let f = (e.x * 24 + 48).midiCps;
	let o = sinOsc(f, 0) * e.z * lag(e.w, 5);
	[delayMap(b, o, 0, a), o]
}.sum
