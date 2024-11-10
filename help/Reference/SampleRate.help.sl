# SampleRate

- _SampleRate()_

Answer the sample rate of the synthesiser.

Compare sine tone derived from sample rate with a 480hz tone:

~~~
SinOsc(
	[
		SampleRate() * 1E-2,
		480
	],
	0
) * 0.1
~~~

* * *

See also: BlockSize, ControlRate, RadiansPerSample, SampleDur

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SampleRate.html)

Categories: Ugen
