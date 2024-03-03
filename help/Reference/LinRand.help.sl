# LinRand

- _LinRand(input)_
- _LinRand(lo=0, hi=1, minmax=0)_

Random number generator.
Unary form generates noise with a linear distribution between _0_ and _input_.

```
LinRand(SinOsc(0.1, 0)) * 0.1
```

The below is zero when _input_ is positive:

```
let n = LinRand(SinOsc(1 / 2, 0)) * 0.1;
n.Abs - n
```

Ternary form generates a single random float value in linear distribution from _lo_ to _hi_,
skewed towards _lo_ if _minmax_ `< 0`, otherwise skewed towards _hi_.

```
let minmax = MouseX(0, 1, 0, 0.2);
{
	let freq = LinRand(200, 10000, minmax);
	let dur = (1 / freq) * 7500;
	FSinOsc(freq, 0) * Line(0.2, 0, dur)
} !^ 15
```

* * *

See also: BiLinRand, IRand, NRand, Rand, Rand2

References:
_Csound_
[1](https://csound.com/docs/manual/linrand.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LinRand.html)
