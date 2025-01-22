# brunsConstant

- _brunsConstant(aNumber)_

Answer _aNumber_ times Brun’s constant,
the number obtained by adding the reciprocals of the odd twin primes.

```
>>> 1.brunsConstant
1.90216058
```

The sequence converges extremely slowly:

```
>>> 1:999.select(isLesserTwinPrime:/1).collect { :each |
>>> 	(1 / each) + (1 / (each + 2))
>>> }.sum
1.51803
```

* * *

See also: boltzmannConstant, e, goldenRatio, isPrime, isLesserTwinPrime, pi, planckConstant, silverConstant, stolarskyHarborthConstant

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BrunsConstant.html),
_OEIS_
[1](https://oeis.org/A065421)
