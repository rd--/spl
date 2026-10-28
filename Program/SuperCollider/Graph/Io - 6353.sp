/* http://scsynth.org/t/6353 ; io ; http://ingoogni.nl/ ; packet size */
let segmentCount = 50;
let shuheiKawachi = { :x :y :a :b |
	let c = a.signedSqrt;
	[
		(x.cos * y.cos),
		(((c * x - y) / b).cos * ((x + (c * y)) / b).cos),
		(((c * x + y) / b).cos * ((x - (c * y * y)) / b).cos)
	].sum
};
let xMajor = 0;
let yMajor = 10;
let rMajor = 30.1;
let rMinor = 0.1;
let circlefreq = 0.0001;
let xMinor = xMajor + (rMajor * SinOsc(circlefreq, 0));
let yMinor = yMajor + (rMajor * SinOsc(circlefreq, 1/2.pi));
let freqList = { 50.expRand(1500) }.!(segmentCount);
let oscList = [1 .. segmentCount].collect { :index |
	let x = xMinor + (rMinor * (index * 2.pi / segmentCount).sin);
	let y = yMinor + (rMinor * (index * 2.pi / segmentCount).cos);
	let grey = shuheiKawachi(x, y, 2.pi, 0.5);
	let amp = Lag(wrap(grey, 0, 1), 0.01) / segmentCount;
	SinOsc(freqList[index], 0) * amp
};
oscList.Splay * 5
