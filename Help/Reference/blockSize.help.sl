# blockSize

- _blockSize()_

Answer the block size of the synthesiser.

The block size is the sample rate divided by the control rate:

~~~
sinOsc(
	[
		blockSize(),
		sampleRate() / controlRate(),
		64
	] * 7,
	0
).splay * 0.05
~~~

* * *

See also: controlRate, radiansPerSample, sampleRate

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_vectorsize/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BlockSize.html)

Categories: Ugen
