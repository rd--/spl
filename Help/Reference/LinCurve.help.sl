# LinCurve

- LinCurve(in, inMin, inMax, outMin, outMax, curve)

Maps a linear input range to a curved output range.

Create a stepped sequence:

```
let rate = MouseY(1 / 7, 1, 0, 0.2);
let div = MouseX(5, 23, 1, 0.2);
let phase = Phasor(0, rate * SampleDur() * [1, Rand(1, 3)], 0, 1, 0);
let warpedPhase = phase.LinCurve(0, 1, 0, 1, 4);
let trigger = Hpz1(warpedPhase) < 0 + Impulse(0, 0);
let wrappedPhase = (warpedPhase * div).Wrap(0, 1);
let warpedTriggers = Hpz1(wrappedPhase) < 0 + Impulse(0, 0);
let stepped = (warpedPhase * div).Floor;
let quantized = stepped / div;
let freq = quantized * TExpRand(111, 1111, trigger) + TExpRand(111, 1111, trigger);
Blip(freq, quantized * 13) * Perc(warpedTriggers, 0.01, 0.1, -4)
```

Plotting, fixed curve:

~~~
let l = Line(-1, 5, 0.1);
let c = l.LinCurve(0, 3, -1, 1, -4);
[l, c].plot(0.1)
~~~

Plotting, time-varying curve:

~~~
let l = SinOsc(100, 0);
let c = l.LinCurve(-1, 1, -1, 1, XLine(-3, -100, 0.1));
[l, c].plot(0.1)
~~~

* * *

See also: LinExp, LinLin

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/UGen.html#-lincurve)
[2](https://scsynth.org/t/pmono-and-dc-ar-to-send-out-stepped-cv-patterns/8773/13):

Categories: Ugen
