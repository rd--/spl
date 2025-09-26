# binomialPascal

- _binomialPascal(n, k)_

Answer the binomial coefficient,
calculated without explicit use of factorials,
allowing for negative _n_ to preserve Pascal’s identity.

```
>>> let n = -8;
>>> let k = 3;
>>> [binomialPascal:/2, binomialGamma:/2]
>>> .collect { :f:/2 |
>>> 	[f(n, k), f(n - 1, k) + f(n - 1, k - 1)]
>>> }
[-120 -120; -171.43 -768.96]
```

The answers for `binomialPascal` and `binomialGamma` agree for positive _n_ and disagree for negative _n_:

```
>>> [10 3; 8 5; 8 4; 6 3; 4 2; 2 3; 1 3]
>>> .collect { :each |
>>> 	let [n, k] = each;
>>> 	[n, n.-].collect { :m |
>>> 		[
>>> 			binomialGamma(m, k),
>>> 			binomialPascal(m, k)
>>> 		]
>>> 	}
>>> }
[
	120 120; -880/3 -220:;
	 56  56; -9504/7 -792:;
	 70  70; 1886.19 330:;
	 20  20; -89.6 -56:;
	  6   6; 50/3 10:;
	  0   0; -16 -4:;
	 -0  -0; -Infinity -1
]
```

_n_ less than _k_:

```
>>> 3.binomialPascal(5)
-0

>>> -3.binomialPascal(5)
-21

>>> 5.binomialPascal(23)
-0

>>> -5.binomialPascal(23)
-17550
```

At `zero`:

```
>>> 0.binomialPascal(0)
1

>>> 0.binomialPascal(1)
0
```

If _k_ is greater than _n_,
and _n_ is positive,
the answer is zero:

```
>>> 3.binomialPascal(6)
0

>>> -3.binomialPascal(6)
28
```

* * *

See also: binomial, binomialGamma

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PascalBinomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Pascal%27s_rule)
[2](https://en.wikipedia.org/wiki/Pascal%27s_triangle)

Categories: Math, Combinatorics
