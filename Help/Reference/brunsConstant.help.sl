# brunsConstant

- _brunsConstant(n)_

Answer _n_ times Brun’s constant _B_,
the number obtained by adding the reciprocals of the odd twin primes.

```
>>> 1.brunsConstant
1.90216058
```

The sequence converges extremely slowly,
the OEIS entry,
[A065421](https://oeis.org/A065421),
has only nine places:

```
>>> 1:999
>>> .select(isLesserTwinPrime:/1)
>>> .collect { :n |
>>> 	(1 / n) + (1 / (n + 2))
>>> }.sum
1.51803
```

Plot convergence:

~~~spl svg=A
1:999
.select(isLesserTwinPrime:/1)
.prefixes
.collect { :q |
	q.collect { :n |
		(1 / n) + (1 / (n + 2))
	}.sum
}.scatterPlot
~~~

![](Help/Image/brunsConstant-A.svg)

* * *

See also: boltzmannConstant, e, goldenRatio, isPrime, isLesserTwinPrime, pi, planckConstant, silverConstant, stolarskyHarborthConstant

Guides: Integer Sequence Functions, Mathematical Constants, Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BrunsConstant.html),
_OEIS_
[1](https://oeis.org/A065421),
_W_
[1](https://en.wikipedia.org/wiki/Brun%27s_theorem)
