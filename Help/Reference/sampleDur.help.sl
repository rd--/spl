# sampleDur

- _sampleDur()_

Answer the sample duration, in seconds, of a sample at the synthesiser.

The sample duration is the `Reciprocal` of the `sampleRate`,
ordinarily a very small number:

```
>>> 1 / [44100 48000]
[2.2267E-7 2.0833E-7]

>>> (1 / 48000 * 1E8).round
2083
```

Compare sine tones:

~~~
sinOsc(
	[
		sampleDur() * 1E8,
		1 / sampleRate() * 1E8,
		2083
	],
	0
).splay * 0.1
~~~

* * *

See also: Reciprocal, controlDur, controlRate, radiansPerSample, sampleRate

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SampleDur.html)

Categories: Ugen
