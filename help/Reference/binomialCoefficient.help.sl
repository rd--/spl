# binomialCoefficient

- _binomialCoefficient(n, k)_

The binomial coefficients are the positive integers that occur as coefficients in the binomial theorem.
Commonly, a binomial coefficient is indexed by a pair of integers n ≥ k ≥ 0.
Tells the number of combinations of _n_ elements taken _k_ at a time.

```
>>> 5.binomialCoefficient(3)
10

>>> 3.binomialCoefficient(5)
0

>>> 6.binomialCoefficient(3)
((6 * 5 * 4) / (1 * 2 * 3))
```

Make Pascal’s triangle (this function is zero outside of Pascal’s triangle):

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

>>> 6.binomialCoefficient(3)
6.take(3)
```

If _k_ is greater than _n_ answer is zero:

```
>>> 3.take(6)
0
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
