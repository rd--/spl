# randRange

- _randRange(lo, hi)_

Random number generator.
Generates random numbers between _lo_ and _hi_.

White noise:

~~~spl syn=A
let n = lfNoise2(1 / 3).linLin(-1, 1, 0.01, 0.1);
randRange([dc(-0.05), 0 - n], [dc(0.05), n])
~~~

Noise between two low frequency oscillators:

~~~spl syn=B
randRange(
	sinOsc(0.1, 0),
	sinOsc(0.42, 0)
) * 0.1
~~~

* * *

See also: rand, tRand, whiteNoise

Guides: Unit Generators

Categories: Ugen
