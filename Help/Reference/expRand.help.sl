# expRand

- _expRand(r, a, b)_
- _expRand(a, b)_

Answer a random number logarithmically distributed between _a_ and _b_.
The ternary form utilises the random number generator _r_.

```
>>> Sfc32(3627814).expRand(1, 900)
74.253

>>> let r = Sfc32(3627814);
>>> { r.expRand(1, 900) } ! 4
[74.253 10.442 11.491 53.526]
```

The binary form answers an initialisation rate unit generator.

~~~spl syn=A
let n = 5;
let freq = { expRand(111, 333) } ! n;
let ampl = { expRand(0.05, 0.10) } ! n;
let o = sinOsc(freq, 0) * ampl;
o.splay
~~~

A `TextureProgram` of pulsing sine tones (Jmcc):

~~~spl texture
{
	eqPan(
		sinOsc(
			expRand(300, 3000),
			0
		) * 0.max(
			sinOsc(
				expRand(1, 15),
				0
			) * 0.05
		),
		rand(-1,1)
	)
}.overlapTextureProgram(4, 4, 4)
~~~

Histogram of random variate of ten-thousand places:

~~~spl svg=A
let r = Sfc32(678123);
(
	{
		r.expRand(23, 71)
	} ! 10_000
).histogramPlot
~~~

![](Help/Image/expRand-A.svg)

* * *

See also:IRand, linRand, nRand, rand, TexpRand, tRand, tiRand,  exp, log, nextRandomFloat

Guides: Random Functions, Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/exprand.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-exprand)
[2](https://doc.sccode.org/Classes/ExpRand.html)
