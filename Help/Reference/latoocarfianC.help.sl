# latoocarfianC

- _latoocarfianC(freq=22050, a=1, b=3, c=0.5, d=0.5, xi=0.5, yi=0.5)_

Latoocarfian chaotic generator.

- freq: iteration frequency in Hertz
- a, b, c, d: equation variables
- xi: initial value of x
- yi: initial value of y

A cubic-interpolating sound generator based on a function given by Clifford Pickover.
The function is:

> 1. _x(n+1) = sin(b * yn) + c * sin(b * xn)_
> 2. _y(n+1) = sin(a * yn) + d * sin(a * xn)_

According to Pickover, parameters a and b should be in the range from -3 to +3,
and parameters c and d should be in the range from 0.5 to 1.5.
The function can,
depending on the parameters given,
give continuous chaotic output,
converge to a single value (silence),
or oscillate in a cycle (tone).

Default initial parameters, mouse control of frequency:

~~~spl syn=A
let x = mouseX(20, sampleRate(), 0, 0.2);
latoocarfianC(
	x,
	1, 3, 0.5, 0.5,
	0.5, 0.5
) * 0.1
~~~

Randomly modulate all parameters:

~~~spl syn=B
latoocarfianC(
	sampleRate() / 4,
	lfNoise2(2) * 1.5 + 1.5,
	lfNoise2(2) * 1.5 + 1.5,
	lfNoise2(2) * 0.5 + 1.5,
	lfNoise2(2) * 0.5 + 1.5,
	0.5,
	0.5
) * 0.1
~~~

Randomly reset parameters in texture:

~~~spl syn=C
{ :tr |
	let sr = sampleRate();
	let freq = tRand(400, sr / 3, tr);
	let a = tRand(-3, 3, tr);
	let b = tRand(-3, 3, tr);
	let c = tRand(0.5, 1.5, tr);
	let d = tRand(0.5, 1.5, tr);
	let l = latoocarfianC(
		freq,
		a, b, c, d,
		0.5, 0.5
	);
	sinOsc(
		freq, 0
	) * 0.05 + pan2(
		l,
		tRand(-1, 1, tr),
		0.05
	)
}.overlapTexture(1, 4, 8).mix
~~~

* * *

See also: henonC

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LatoocarfianC.html)

Categories: Ugen
