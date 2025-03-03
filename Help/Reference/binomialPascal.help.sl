# binomialPascal

- _binomialPascal(n, k)_

Answer the binomial coefficient,
calculated without explicit use of factorials,
allowing for negative _n_.

```
>>> 4.binomialPascal(2)
6

>>> -4.binomialPascal(2)
10

>>> 6.binomialPascal(3)
20

>>> -6.binomialPascal(3)
-56

>>> 8.binomialPascal(4)
70

>>> -8.binomialPascal(4)
330

>>> 8.binomialPascal(5)
56

>>> -8.binomialPascal(5)
-792
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

See also: binomial, factorial, multinomial, smoothstepFunction

References:
_W_
[1](https://en.wikipedia.org/wiki/Pascal%27s_triangle)

Categories: Math, Combinatorics
