# linCurve

- _linCurve(in, inMin, inMax, outMin, outMax, curve)_

Maps a linear input range to a curved output range.

The output clips when the input is out of range:

~~~spl syn=A
sinOsc(
	phasor(1, 3E-5, -1, 5, 0)
	.linCurve(0, 3, 111, 333, -4),
	0
) * 0.1
~~~

Create a stepped sequence:

~~~spl syn=B
let rate = mouseY(1 / 7, 1, 0, 0.2);
let div = mouseX(5, 23, 1, 0.2);
let phase = phasor(
	0,
	rate * sampleDur() * [1, rand(1, 3)],
	0,
	1,
	0
);
let toTrigger = { :x |
	hpz1(x) < 0 + impulse(0, 0)
};
let warpedPhase = phase.linCurve(0, 1, 0, 1, 4);
let trigger = warpedPhase.toTrigger;
let wrappedPhase = (warpedPhase * div).wrap(0, 1);
let warpedTriggers = wrappedPhase.toTrigger;
let stepped = (warpedPhase * div).floor;
let quantized = stepped / div;
let freq = quantized.*+(
	tExpRand(111, 1111, trigger),
	tExpRand(111, 1111, trigger)
);
let signal = blip(freq, quantized * 13);
signal * perc(warpedTriggers, 0.01, 0.1, -4)
~~~

Plotting, fixed curve:

~~~spl ui
let l = line(-1, 5, 0.1);
let c = l.linCurve(0, 3, -1, 1, -4);
[l, c].soundPlot(0.1)
~~~

Plotting, time-varying curve:

~~~spl ui
let l = sinOsc(100, 0);
let c = l.linCurve(-1, 1, -1, 1, xLine(-3, -100, 0.1));
[l, c].soundPlot(0.1)
~~~

* * *

See also: linExp, linLin

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/UGen.html#-lincurve)
[2](https://scsynth.org/t/pmono-and-dc-ar-to-send-out-stepped-cv-patterns/8773/13):
