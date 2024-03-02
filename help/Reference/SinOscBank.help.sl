# SinOscBank

- _SinOscBank(freqList, ampList, phaseList)_

Sin oscillator bank.
A summed set of fixed frequency sin oscillators.

- freqList: frequency list
- ampList: amplitude list
- phaseList: phase list

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

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Klang.html)

Categories: Ugen
