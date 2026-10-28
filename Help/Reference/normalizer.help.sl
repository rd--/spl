# normalizer

- _normalizer(input, level, lookAheadTime)_

Flatten dynamics.
Normalizes the input amplitude to the given level.
Normalize will not overshoot like compander will, but it needs to look ahead in the audio.
Thus there is a delay equal to twice the lookAheadTime.

- input: the signal to be processed.
- level: the peak output amplitude level to which to normalize the input.
- lookAheadTime: the buffer delay time. Shorter times will produce smaller delays and quicker transient response times, but may introduce amplitude modulation artifacts.

Unprocessed signal at left, normalized at right:

~~~
let z = decay2(
	impulse(8, 0) * (lfSaw(0.25, 0) * -0.6 + 0.7),
	0.001,
	0.3
) * fSinOsc(500, 0);
[z, normalizer(z, 0.4, 0.01)] * 0.2
~~~

* * *

Guides: Unit Generators

Categories: Ugen
