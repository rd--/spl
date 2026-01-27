# isHarmonicDivisorNumber

- _isHarmonicDivisorNumber(n)_

Answer `true` if the integer _n_ is a harmonic divisor number,
also called an Ore number.

```
>>> 8128.isHarmonicDivisorNumber
true

>>> 27846.isHarmonicDivisorNumber
true
```

The first few harmonic divisor numbers:

```
>>> 1:300.select(isHarmonicDivisorNumber:/1)
[1 6 28 140 270]
```

* * *

See also: divisorSigma, divisors, harmonicMean

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicDivisorNumber.html),
_OEIS_
[1](https://oeis.org/A001599),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_divisor_number)
