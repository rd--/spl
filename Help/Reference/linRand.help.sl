# linRand

- _linRand(input)_
- _linRand(lo=0, hi=1, minmax=0)_

Random number generator.
Unary form generates noise with a linear distribution between _0_ and _input_.

```
linRand(sinOsc(0.1, 0)) * 0.1
```

The below is zero when _input_ is positive:

```
let n = linRand(sinOsc(1 / 2, 0)) * 0.1;
n.abs - n
```

Ternary form generates a single random float value in linear distribution from _lo_ to _hi_,
skewed towards _lo_ if _minmax_ `< 0`, otherwise skewed towards _hi_.

```
let minmax = mouseX(0, 1, 0, 0.2);
{
	let freq = linRand(200, 10000, minmax);
	let dur = (1 / freq) * 7500;
	fSinOsc(freq, 0) * line(0.2, 0, dur)
} !^ 15
```

* * *

See also: BiLinRand, iRand, nRand, rand, rand2

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/linrand.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LinRand.html)

Categories: Ugen
