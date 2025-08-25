# SampleDur

- _SampleDur()_

Answer the sample duration, in seconds, of a sample at the synthesiser.

The sample duration is the `Reciprocal` of the `SampleRate`,
ordinarily a very small number:

```
>>> 1 / [44100 48000]
[2.2267E-7 2.0833E-7]

>>> (1 / 48000 * 1E8).round
2083
```

Compare sine tones:

~~~
SinOsc(
	[
		SampleDur() * 1E8,
		1 / SampleRate() * 1E8,
		2083
	],
	0
).Splay * 0.1
~~~

* * *

See also: ControlDur, ControlRate, RadiansPerSample, Reciprocal, SampleRate

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SampleDur.html)

Categories: Ugen
