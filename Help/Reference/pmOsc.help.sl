# pmOsc

- _pmOsc(carFreq, modFreq, index=0, modPhase=0)_

Phase modulation sine oscillator pair.

- carFreq: carrier frequency in cycles per second.
- modFreq: modulator frequency in cycles per second.
- index: modulation index in radians.
- modPhase: a modulation input for the modulators phase in radians

Modulate carrier frequency:

~~~spl syn=A
pmOsc(line(600, 900, 5), 600, 3, 0) * 0.1
~~~

Modulate modulator frequency:

~~~spl syn=B
pmOsc(300, line(600, 900, 5), 3, 0) * 0.1
~~~

Modulate index:

~~~spl syn=C
pmOsc(300, 550, line(0, 20, 8), 0) * 0.1
~~~

Texture:

~~~spl syn=D
{ :tr |
	linPan2(
		pmOsc(
			tRand(20, 2000, tr),
			tRand(0, 800, tr),
			tLine(0, tRand(0, 12, tr), 9, tr),
			0
		),
		tRand(-1, 1, tr),
		0.1
	)
}.overlapTexture(2, 5, 4).mix
~~~

* * *

See also: sinOsc

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PMOsc.html)

Categories: Oscillator
