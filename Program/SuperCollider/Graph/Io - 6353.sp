/* http://scsynth.org/t/6353 ; io ; http://ingoogni.nl/ */
let shuheiKawachi = { :x :y :a :b |
	[
		(x.Cos * y.Cos),
		(((a.Sqrt * x - y) / b).Cos * ((x + (a.Sqrt * y)) / b).Cos),
		(((a.Sqrt * x + y) / b).Cos * ((x - (a.Sqrt * y * y)) / b).Cos)
	].Sum
};
let segmentCount = 50;
let xMajor = 0;
let yMajor = 10;
let rMajor = 30.1;
let rMinor = 0.1;
let circlefreq = 0.0001;
let xMinor = xMajor + (rMajor * SinOsc(circlefreq, 0));
let yMinor = yMajor + (rMajor * SinOsc(circlefreq, 1/2.pi));
let freqList = { 50.ExpRand(1500) }.!(segmentCount);
let oscList = (1 .. segmentCount).collect { :index |
	let x = xMinor + (rMinor * (index * 2.pi / segmentCount).Sin);
	let y = yMinor + (rMinor * (index * 2.pi / segmentCount).Cos);
	let grey = shuheiKawachi(x, y, 2.pi, 0.5);
	let amp = Lag(Wrap(grey, 0, 1), 0.01) / segmentCount;
	SinOsc(freqList[index], 0) * amp
};
oscList.Splay * 5
