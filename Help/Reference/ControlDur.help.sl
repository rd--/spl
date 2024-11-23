# ControlDur

- _ControlDur()_

Answer the duration, in seconds, of a sample block at the synthesiser.

The control duration is the block size divided by the sample rate:

```
>>> [48 64] / 48000
[1E-3 1.3333E-3]

>>> (64 / 48000 * 1E6).rounded
1333
```

Compare sine tones:

~~~
SinOsc(
	[
		ControlDur() * 1E6,
		BlockSize() / SampleRate() * 1E6,
		1333
	],
	0
).Splay * 0.1
~~~

It is also the inverse of the control rate:

~~~
SinOsc(
	[
		ControlDur() * 1E6,
		1 / ControlRate() * 1E6,
		1333
	],
	0
).Splay * 0.1
~~~

* * *

See also: ControlRate, RadiansPerSample, SampleDur, SampleRate

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ControlDur.html)

Categories: Ugen, Control
