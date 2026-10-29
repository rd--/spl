# latch

- _latch(in=0, trig=0)_

Sample and hold.
Holds input signal value when triggered.

- in: input signal
- trig: trigger

Step noise:

~~~spl syn=A
latch(whiteNoise(), impulse(900, 0)) * 0.1
~~~

Step noise as frequency input:

~~~spl syn=B
blip(
	latch(
		whiteNoise(),
		impulse(9, 0)
	) * 400 + 500,
	4
) * 0.1
~~~

The above are just meant as examples.
_lfNoise0_ is a faster way to generate random steps:

~~~spl syn=C
blip(lfNoise0(9) * 400 + 500, 4) * 0.1
~~~

Array expansion:

~~~spl syn=D
whiteNoise()
.latch(impulse([2, 7], 0))
.linLin(-1, 1, 222, 777)
.sinOsc(0) * 0.1
~~~

Plotting:

~~~spl ui
let d = dust([1 5] * 100);
latch(d, d).soundPlot(0.1)
~~~

* * *

See also: gate

Guides: Unit Generators

References:
_Csound_
[1](http://csound.com/docs/manual/samphold.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Latch.html)

Categories: Ugen
