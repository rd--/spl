# controlDur

- _controlDur()_

Answer the duration, in seconds, of a sample block at the synthesiser.

The control duration is the block size divided by the sample rate:

```
>>> [48 64] / 48000
[1E-3 1.3333E-3]

>>> (64 / 48000 * 1E6).round
1333
```

Compare sine tones:

~~~spl syn=A
sinOsc(
	[
		controlDur() * 1E6,
		blockSize() / sampleRate() * 1E6,
		1333
	],
	0
).splay * 0.1
~~~

It is also the inverse of the control rate:

~~~spl syn=B
sinOsc(
	[
		controlDur() * 1E6,
		1 / controlRate() * 1E6,
		1333
	],
	0
).splay * 0.1
~~~

* * *

See also: controlRate, radiansPerSample, sampleDur, sampleRate

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ControlDur.html)

Categories: Ugen, Control
