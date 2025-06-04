# RadiansPerSample

- _RadiansPerSample()_

Answer the radians per sample of the synthesiser.

Ordinarily a very small number:

~~~
>>> 2.pi / 48000
1.30899E-4

>>> (2.pi / 48000 * 1E7).rounded
1309
~~~

Compare sine tones:

~~~
SinOsc(
	[
		RadiansPerSample() * 1E7,
		(2.pi / 48000) * 1E7,
		1309
	],
	0
).Splay * 0.1
~~~

* * *

See also: BlockSize, ControlRate, SampleDur, SampleRate

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/RadiansPerSample.html)

Categories: Ugen
