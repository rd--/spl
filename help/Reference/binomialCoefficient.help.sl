# binomialCoefficient

- _binomialCoefficient(n, k)_

The binomial coefficients are the positive integers that occur as coefficients in the binomial theorem.
Commonly, a binomial coefficient is indexed by a pair of integers n ≥ k ≥ 0.

```
>>> 5.binomialCoefficient(3)
10

>>> 3.binomialCoefficient(5)
0
```

Make Pascal’s triangle:

```
>>> 0:5.collect { :each | each.binomialCoefficient(0:each) }
[1; 1 1; 1 2 1; 1 3 3 1; 1 4 6 4 1; 1 5 10 10 5 1]
```

At zero:

```
>>> 0.binomialCoefficient(0)
1
```

At LargeInteger:

```
>>> 333n.binomialCoefficient(33n)
3888653852803216535842634400242612716809201918n
```

* * *

See also: factorial

References:
_Apl_
[1](https://aplwiki.com/wiki/Binomial),
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialCoefficient.html)
[2](https://reference.wolfram.com/language/ref/Binomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_coefficient)
