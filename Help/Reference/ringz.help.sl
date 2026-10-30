# ringz

- _ringz(in, freq=440, decaytime=1)_

Ringing filter.
This is the same as resonz, except that instead of a resonance parameter, the bandwidth is specified in a 60dB ring decay time.
One `ringz` is equivalent to one component of `ringzBank`.

- in: input signal to be processed
- freq: resonant frequency in Hertz
- decaytime: the 60 dB decay time of the filter

Resonant dust:

~~~spl syn=A
ringz(dust(3) * 0.1, 2000, 2)
~~~

Resonant noise:

~~~spl syn=B
ringz(whiteNoise() * 0.005, 2000, 0.5)
~~~

Modulate frequency:

~~~spl syn=C
let freq = xLine(100, 3000, 10);
[
	ringz(whiteNoise() * 0.005, freq, 0.5),
	ringz(impulse(6, 0) * 0.1, freq, 0.5)
]
~~~

Modulate ring time:

~~~spl syn=D
ringz(
	impulse(6, 0) * 0.1,
	2000,
	xLine(4, 0.04, 8)
)
~~~

Modulate ring time opposite direction:

~~~spl syn=E
ringz(
	impulse(6, 0) * 0.1,
	2000,
	xLine(0.04, 4, 8)
)
~~~

Parallel filters with frequency ramps:

~~~spl syn=F
let exciter = whiteNoise() * 0.001;
{
	ringz(
		exciter,
		xLine(
			expRand(100, 5000),
			expRand(100, 5000),
			20
		),
		0.5
	)
} !^ 10
~~~

Texture of above:

~~~spl syn=G
{ :tr |
	let exciter = whiteNoise() * 0.001;
	{
		ringz(
			exciter,
			txLine(
				tExpRand(100, 5000, tr),
				tExpRand(100, 5000, tr),
				20,
				tr
			),
			0.5
		)
	} !^ 10
}.overlapTexture(5, 10, 9).mix
~~~

Fixed exponentially spaced resonators, stereo:

~~~spl syn=H
let k = 111;
{
	ringz(
		pinkNoise() * 0.1,
		{ expRand(333, 22222) } ! k,
		1
	).mean
} ! 2 * 0.22
~~~

As above with envelope:

~~~spl syn=I
let k = 222;
{
	ringz(
		lpf(
			pinkNoise() * 0.22,
			perc(1, 0, 5.5, -4) * 22222 + 10
		),
		{ expRand(333, 22222) } ! k,
		1
	).mean
} ! 2 * 0.22
~~~

* * *

See also: formlet, resonz, rhpf, rlpf

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Ringz.html)

Categories: Ugen, Filter
