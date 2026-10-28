/* miBraids ; basic example ; requires=keywords */
miBraids(
	pitch: 60,
	timbre: 0.5,
	color: 0.5,
	model: 6,
	trig: 0,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.05)

/* miBraids ; some modulation ; requires=keywords */
let mod = lfNoise1(0.5) * 0.5 + 0.5;
miBraids(
	pitch: 40,
	timbre: mod,
	color: 0,
	model: 1,
	trig: 0,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.05)

/* miBraids ; vosim ; requires=keywords */
let pitch = linLin(lfNoise0(4), -1, 1, 33, 66).round(1);
let timbre = lfNoise1(0.3) * 0.5 + 0.5;
let color = lfNoise1(0.3) * 0.5 + 0.5;
miBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 21,
	trig: 0,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.1)

/* miBraids ; fluted ; requires=keywords */
let pitch = 38;
let timbre = mouseX(0.7, 1, 0, 0.2);
let color = mouseY(0, 1, 0, 0.2);
miBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 31,
	trig: 0,
	resamp: 1,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.1)

/* miBraids ; scanning ; requires=keywords */
let pitch = mouseY(33, 72, 0, 0.2);
let timbre = lfNoise1(0.3) * 0.5 + 0.5;
let color = lfNoise1(0.3) * 0.5 + 0.5;
let model = mouseX(0, 47, 0, 0.2);
miBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: model,
	trig: 0,
	resamp: 1,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.1)

/* miBraids ; paraphonic ; requires=keywords */
let timbre = lfNoise1(0.03) * 0.5 + 0.5;
let color = lfNoise1(0.05) * 0.5 + 0.5; /* chord */
miBraids(
	pitch: 38,
	timbre: timbre,
	color: color,
	model: 40,
	trig: 0,
	resamp: 1,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.1)

/* miBraids ; trigger ; 28=plucked ; requires=keywords */
let tr = dust(0.6);
let pitch = tRand(45, 72, tr).round(1);
let timbre = 0.5;
let color = lfNoise1(0.3) * 0.5 + 0.5;
miBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 28,
	trig: tr,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.1)

/* miBraids ; 34=kick ; requires=keywords */
let trig = impulse(4, 0);
let pitch = linLin(latch(pinkNoise(), trig), -1, 1, 30, 50).round(1);
let timbre = lfNoise1(0.4) * 0.5 + 0.5;
let color = lfNoise1(0.3) * 0.5 + 0.5;
miBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 34,
	trig: trig,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
).pan2(0, 0.2)

/* miBraids ; 34=kick ; sample rate, bit reduction and distortion ; requires=keywords */
let tr = coinGate(0.3, impulse(4, 0));
let decim = tRand(1, 32, tr);
let ws = linLin(lfTri(0.2, 0), -1, 1, 0,1);
miBraids(
	pitch: 40,
	timbre: 0.7,
	color: 0.7,
	model: 34,
	trig: tr,
	resamp: 2,
	decim: decim,
	bits: 3,
	ws: ws
).pan2(0, 0.1)
