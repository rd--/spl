# binomial

- _binomial(n, k)_

The binomial coefficients are the positive integers that occur as coefficients in the binomial theorem.
Commonly, a binomial coefficient is indexed by a pair of integers n ≥ k ≥ 0.
Tells the number of combinations of _n_ elements taken _k_ at a time.

```
>>> 5.binomial(3)
10

>>> 3.binomial(5)
0

>>> 6.binomial(3)
((6 * 5 * 4) / (1 * 2 * 3))

>>> 8.binomial(4)
70

>>> 8.5.binomial(-4.2)
0.0000604992

>>> 2.binomial(0.5)
(16 / 3.pi)
```

_k_ may be a collection:

```
>>> [10 1 2 5].collect { :each | 10.binomial(each) }
[1 10 45 252]

>>> 10.binomial([10 1 2 5])
[1 10 45 252]
```

Evaluate for half-integer arguments:

```
>>> (9 / 2).binomial(7 / 2)
(9 / 2)
```

Make Pascal’s triangle (this function is zero outside of Pascal’s triangle):

```
>>> 0:5.collect { :each | each.binomial(0:each) }
[1; 1 1; 1 2 1; 1 3 3 1; 1 4 6 4 1; 1 5 10 10 5 1]
```

At zero:

```
>>> 0.binomial(0)
1

>>> 0.binomial(1)
0
```

At LargeInteger:

```
>>> 333n.binomial(33n)
3888653852803216535842634400242612716809201918n
```

>>> 6.binomial(3)
6.take(3)
```

If _k_ is greater than _n_ answer is zero:

```
>>> 3.take(6)
0
```

Plot over a subset of the reals as a function of its first parameter:

~~~
(-1.975, -1.95 .. 4).asList.collect { :x | x.binomial(3) }.plot
~~~

Plot over a subset of the reals as a function of its second parameter:

~~~
(-1.975, -1.95 .. 4).asList.collect { :x | 3.binomial(x) }.plot
~~~

* * *

See also: factorial, multinomial

References:
_Apl_
[1](https://aplwiki.com/wiki/Binomial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialCoefficient.html)
[2](https://reference.wolfram.com/language/ref/Binomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_coefficient)
