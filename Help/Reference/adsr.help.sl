# adsr

- adsr(gate, attackTime, decayTime, sustainLevel, releaseTime, curve)

Attack-decay-sustain-release envelope.

~~~spl syn=A
let gate = lfPulse(0.5, 0, 0.5) > 0;
let attackTime = 0.05;
let decayTime = 0.15;
let sustainLevel = 0.4;
let releaseTime = 0.1;
let curve = 0;
let envelope = adsr(
	gate,
	attackTime,
	decayTime,
	sustainLevel,
	releaseTime,
	curve
);
sinOsc(440, 0) * envelope * 0.1
~~~

* * *

See also: asr, envGen, perc

Guides: Unit Generators

Categories: Ugen, Envelope
