# nRand

- _nRand(lo, hi, n)_

Random number generator.
Generates a single random float value in a sum of n uniform distributions from lo to hi.

- n = 1 : uniform distribution, same as rand
- n = 2 : triangular distribution
- n = 3 : smooth hump

As n increases, distribution converges towards gaussian.

```
let n = mouseX(1, 9, 0, 0.2).round(1);
{
	let freq = nRand(200, 10000, n);
	let dur = (1 / freq) * 7500;
	fSinOsc(freq, 0) * line(0.2, 0, dur)
} !^ 15
```

* * *

See also: iRand, linRand, rand, tExpRand, tRand, tiRand, expRand

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/NRand.html)

Categories: Ugen
