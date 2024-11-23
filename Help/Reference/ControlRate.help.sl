# ControlRate

- _ControlRate()_

Answer the control rate of the synthesiser.

The control rate is the sample rate divided by the block size:

```
>>> 48000 / [64 48]
[750 1000]
```

Compare sine tones:

~~~
SinOsc(
	[
		ControlRate(),
		SampleRate() / BlockSize(),
		750
	],
	0
).Splay * 0.1
~~~

It is also the inverse of the control duration:

~~~
SinOsc(
	[
		ControlRate(),
		1 / ControlDur(),
		750
	],
	0
).Splay * 0.1
~~~

* * *

See also: ControlDur, RadiansPerSample, SampleDur, SampleRate

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ControlRate.html)

Categories: Ugen, Control
