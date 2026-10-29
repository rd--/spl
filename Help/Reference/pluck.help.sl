# pluck

- _pluck(in, trig=1, maxDelayTime=0.2, delayTime=0.2, decayTime=1, coef=0.5)_

Karplus-strong algorithm.

- in: an excitation signal
- trig: fill delay line on trigger
- maxDelayTime: the max delay time in seconds (initializes the internal delay buffer)
- delayTime: delay time in seconds
- decayTime: time for the echoes to decay by 60 decibels, negative times emphasize odd partials
- coef: the coef of the internal `onePole` filter, values should be between -1 and +1

On _trig_, _n_ samples of the excitation signal are fed into the delay line, where _n = delaytime * sampleRate() / 2_.
The delay line is filled using a rectangular envelope, that is there is no fading.

Excitation signal is `whiteNoise`, triggered twice a second with varying `onePole` coef:

~~~spl syn=A
pluck(
	whiteNoise() * 0.1,
	impulse(2, 0),
	1 / 440,
	1 / 440,
	10,
	mouseX(-0.999, 0.999, 0, 0.2)
)
~~~

Randomised duplicates:

~~~spl syn=B
let k = 12;
let freq = sinOsc(
	{ rand(0.01, 0.15) } ! k,
	{ rand(0, 1) } ! k
).linLin(-1, 1, 777, 3333);
splay(
	leakDc(
		pluck(
			[whiteNoise() / 4] # k,
			impulse({ rand(3, 11) } ! k, 0),
			1 / 100,
			1 / freq,
			2,
			rand(0.01, 0.2)
		),
		0.995
	)
)
~~~

* * *

See also: onePole, whiteNoise

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/pluck.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pluck.html)

Further Reading: Karplus 1983

Categories: Ugen
