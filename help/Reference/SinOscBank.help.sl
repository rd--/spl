# SinOscBank -- sin oscillator bank

_SinOscBank(freqList, ampList, phaseList)_

A summed set of fixed frequency sin oscillators.

- freqList: frequency array
- ampList: amplitude array
- phaseList: phase array

Crossfading randomised oscillator banks:

```
{ :tr |
	{
		SinOscBank(
			{ TRand(600, 1000, tr) } ! 8,
			0.1,
			{ TRand(0, 1, tr) } ! 8
		)
	} ! 2 * 0.1
}.XFadeTexture(3, 4)
```

Equivalent to:

```
{ :tr |
	{
		{
			SinOsc(
				TRand(600, 1000, tr),
				TRand(0, 1, tr)
			) * 0.1
		} !+ 8
	} ! 2 * 0.1
}.XFadeTexture(3, 4)
```

* * *

See also: RingzBank
