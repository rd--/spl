# controlRate

- _controlRate()_

Answer the control rate of the synthesiser.

The control rate is the `sampleRate` divided by the `blockSize`:

```
>>> 48000 / [64 48]
[750 1000]
```

Compare sine tones:

~~~spl syn=A
sinOsc(
	[
		controlRate(),
		sampleRate() / blockSize(),
		750
	],
	0
).splay * 0.1
~~~

It is also the `reciprocal` of the `controlDur`:

~~~spl syn=B
sinOsc(
	[
		controlRate(),
		1 / controlDur(),
		750
	],
	0
).splay * 0.1
~~~

* * *

See also: controlDur, radiansPerSample, sampleDur, sampleRate

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ControlRate.html)

Categories: Ugen, Control
