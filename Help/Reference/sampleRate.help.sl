# sampleRate

- _sampleRate()_

Answer the sample rate of the synthesiser.

Compare sine tone derived from sample rate with a 480hz tone:

~~~
sinOsc(
	[
		sampleRate() * 1E-2,
		480
	],
	0
) * 0.1
~~~

* * *

See also: blockSize, controlRate, radiansPerSample, sampleDur

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_samplerate/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SampleRate.html)

Categories: Ugen
