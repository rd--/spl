# sinOscBank

- _sinOscBank(freqList, ampList, phaseList)_

Sin oscillator bank.
A summed set of fixed frequency sin oscillators.

- freqList: frequency list
- ampList: amplitude list
- phaseList: phase list

Crossfading randomised oscillator banks:

~~~spl syn=A
{ :tr |
	{
		sinOscBank(
			{ tRand(600, 1000, tr) } ! 8,
			0.1,
			{ tRand(0, 1, tr) } ! 8
		)
	} ! 2 * 0.1
}.xFadeTexture(3, 4)
~~~

Equivalent to:

~~~spl syn=B
{ :tr |
	{
		{
			sinOsc(
				tRand(600, 1000, tr),
				tRand(0, 1, tr)
			) * 0.1
		} !+ 8
	} ! 2 * 0.1
}.xFadeTexture(3, 4)
~~~

* * *

See also: ringzBank, sinOsc

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Klang.html)

Categories: Ugen
