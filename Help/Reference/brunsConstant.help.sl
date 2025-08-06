# brunsConstant

- _brunsConstant(n)_

Answer _n_ times Brun’s constant _B_,
the number obtained by adding the reciprocals of the odd twin primes.

```
>>> 1.brunsConstant
1.90216058
```

The sequence converges extremely slowly:

```
>>> 1:999
>>> .select(isLesserTwinPrime:/1)
>>> .collect { :each |
>>> 	(1 / each) + (1 / (each + 2))
>>> }.sum
1.51803
```

* * *

See also: boltzmannConstant, e, goldenRatio, isPrime, isLesserTwinPrime, pi, planckConstant, silverConstant, stolarskyHarborthConstant

Guides: Integer Sequences, Mathematical Constants, Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BrunsConstant.html),
_OEIS_
[1](https://oeis.org/A065421)
