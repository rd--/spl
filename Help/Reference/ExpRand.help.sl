# ExpRand

- _ExpRand(lo, hi)_

Random number generator.
Generates a single random float value in an exponential distributions from _lo_ to _hi_.

```
let n = 5;
let freq = { ExpRand(111, 333) } ! n;
let ampl = { ExpRand(0.05, 0.10) } ! n;
let o = SinOsc(freq, 0) * ampl;
o.Splay
```

`TextureProgram` of pulsing sine tones (Jmcc):

~~~
{
	EqPan(
		SinOsc(
			ExpRand(300, 3000),
			0
		) * 0.Max(
			SinOsc(
				ExpRand(1, 15),
				0
			) * 0.05
		),
		Rand(-1,1)
	)
}.overlapTextureProgram(4, 4, 4)
~~~

* * *

See also: IRand, LinRand, NRand, Rand, TExpRand, TiRand, TRand

References:
_Csound_
[1](https://csound.com/docs/manual/exprand.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/ExpRand.html)

Categories: Ugen, Random
