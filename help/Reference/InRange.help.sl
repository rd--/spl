# InRange

- _InRange(in, lo=-1, hi=1)_

Tests if a signal is within a given range.
If _in_ is >= _lo_ and <= _hi_ output 1, otherwise output 0.
Output is initially zero.

- in: signal to be tested
- lo: low threshold
- hi: high threshold

Trigger noise burst:

```
InRange(
	SinOsc(1, 0) * 0.2,
	[-0.15, -0.1],
	[0.15, 0.2]
) * PinkNoise() * 0.1
```
