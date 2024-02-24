# multinomial

- _multinomial(aCollection)_

Answer the multinomial coefficient.

```
>>> [1 2 1].multinomial
12

>>> (1 .. 5).collect { :n | [n 2 3].multinomial }
[60 210 560 1260 2520]
```

Values at zero:

```
>>> [0 0 1].multinomial
1

>>> [0 0 0].multinomial
1
```

* * *

See also: binomial, factorial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MultinomialCoefficient.html)
[2](https://reference.wolfram.com/language/ref/Multinomial.html)
