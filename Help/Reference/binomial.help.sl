# binomial

- _binomial(n, k)_

The binomial coefficients are the positive integers that occur as coefficients in the binomial theorem.
Commonly, a binomial coefficient is indexed by a pair of integers _n ≥ k ≥ 0_.
Tells the number of combinations of _n_ elements taken _k_ at a time.

```
>>> 4.binomial(2)
6

>>> 6.binomial(3)
20

>>> 8.binomial(4)
70

>>> 8.binomial(5)
56
```

_n_ less than _k_:

```
>>> 3.binomial(5)
0

>>> 5.binomial(23)
0
```

Real valued arguments:

```
>>> 8.5.binomial(-4.2)
0.0000604992

>>> 2.binomial(0.5)
(16 / 3.pi)
```

_k_ may be a collection:

```
>>> [10 1 2 5].collect { :each |
>>> 	10.binomial(each)
>>> }
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
>>> 0:5.collect { :each |
>>> 	each.binomial(0:each)
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1
]
```

At `zero`:

```
>>> 0.binomial(0)
1

>>> 0.binomial(1)
0
```

At `LargeInteger`:

```
>>> 333n.binomial(33n)
3888653852803216535842634400242612716809201918n
```

If _k_ is greater than _n_ the answer is zero:

```
>>> 3.binomial(6)
0
```

Threads over lists:

```
>>> 5.binomial([3 4 5])
[10 5 1]

>>> 11:13.binomial(1:3)
[11 66 286]

>>> [
>>> 	11.binomial(1),
>>> 	12.binomial(2),
>>> 	13.binomial(3)
>>> ]
[11 66 286]
```

Plot over a subset of the reals as a function of its first parameter:

~~~spl svg=A
(-1.975 -- 4).functionPlot { :x |
	x.binomial(3)
}
~~~

![](sw/spl/Help/Image/binomial-A.svg)

Plot over a subset of the reals as a function of its second parameter:

~~~spl svg=B
(-1.975 -- 4).functionPlot { :x |
	3.binomial(x)
}
~~~

![](sw/spl/Help/Image/binomial-B.svg)

* * *

See also: factorial, multinomial

References:
_Apl_
[1](https://aplwiki.com/wiki/Binomial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialCoefficient.html)
[2](https://mathworld.wolfram.com/Choose.html)
[3](https://reference.wolfram.com/language/ref/Binomial.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/nchoosek.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_coefficient)

Categories: Math, Combinatorics
