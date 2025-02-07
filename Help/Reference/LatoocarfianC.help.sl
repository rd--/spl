# LatoocarfianC

- _LatoocarfianC(freq=22050, a=1, b=3, c=0.5, d=0.5, xi=0.5, yi=0.5)_

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

~~~
let x = MouseX(20, SampleRate(), 0, 0.2);
LatoocarfianC(
	x,
	1, 3, 0.5, 0.5,
	0.5, 0.5
) * 0.1
~~~

Randomly modulate all parameters:

~~~
LatoocarfianC(
	SampleRate() / 4,
	LfNoise2(2) * 1.5 + 1.5,
	LfNoise2(2) * 1.5 + 1.5,
	LfNoise2(2) * 0.5 + 1.5,
	LfNoise2(2) * 0.5 + 1.5,
	0.5,
	0.5
) * 0.1
~~~

Randomly reset parameters in texture:

~~~
{ :tr |
	let sr = SampleRate();
	let freq = TRand(400, sr / 3, tr);
	let a = TRand(-3, 3, tr);
	let b = TRand(-3, 3, tr);
	let c = TRand(0.5, 1.5, tr);
	let d = TRand(0.5, 1.5, tr);
	let l = LatoocarfianC(
		freq,
		a, b, c, d,
		0.5, 0.5
	);
	SinOsc(
		freq, 0
	) * 0.05 + Pan2(
		l,
		TRand(-1, 1, tr),
		0.05
	)
}.OverlapTexture(1, 4, 8).Mix
~~~

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LatoocarfianC.html)

Categories: Ugen
