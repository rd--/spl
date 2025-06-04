# BlockSize

- _BlockSize()_

Answer the block size of the synthesiser.

The block size is the sample rate divided by the control rate:

~~~
SinOsc(
	[
		BlockSize(),
		SampleRate() / ControlRate(),
		64
	] * 7,
	0
).Splay * 0.05
~~~

* * *

See also: ControlRate, RadiansPerSample, SampleRate

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_vectorsize/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BlockSize.html)

Categories: Ugen
