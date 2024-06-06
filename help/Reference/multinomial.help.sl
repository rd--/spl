# multinomial

- _multinomial(aCollection)_

Answer the multinomial coefficient.

```
>>> [1 2 1].multinomial
12

>>> [2, 0.2, 5].multinomial
34.3178

>>> [1 / 3, 1 / 7, 1 / 5, 1 / 6].multinomial
1.32595

>>> [1 / 3, 1 / 11, 1 / 5, 1 / 6].multinomial
1.27878
````

Values of `multinomial` at fixed points:

```
>>> (1 .. 5).collect { :n |
>>> 	[n 2 3].multinomial
>>> }
[60 210 560 1260 2520]
```

Values at zero:

```
>>> [0 0 1].multinomial
1

>>> [0 0 0].multinomial
1
```

The number of distinct permutations of _Mississippi_ is:

```
>>> [1 4 4 2].multinomial
34650
```

Plot over a subset of the reals:

~~~
(-2 -- 4).functionPlot { :x |
	[x 0.5 3].multinomial
}
~~~

* * *

See also: binomial, factorial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MultinomialCoefficient.html)
[2](https://reference.wolfram.com/language/ref/Multinomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Multinomial_theorem)
