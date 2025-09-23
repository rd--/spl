# multinomial

- _multinomial(c)_

Answer the multinomial coefficient of the collection _c_,
the number of distinct permutations in a multiset of cardinalty _|c|_ and multiplicities _c_.

```
>>> [1 2 1].multinomial
12
```

With non-integer values:

```
>>> [2 0.2 5].multinomial
34.3178

>>> [3 7 5 6]./.multinomial
1.32595

>>> [3 11 5 6]./.multinomial
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
>>> 'Mississippi'.counts
['i' -> 4, 'M' -> 1, 'p' -> 2, 's' -> 4]

>>> [4 1 2 4].multinomial
34650
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 4).functionPlot { :x |
	[x 0.5 3].multinomial
}
~~~

![](sw/spl/Help/Image/multinomial-A.svg)

* * *

See also: binomial, factorial, multichoose

Guides: Combinatorial Functions, Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MultinomialCoefficient.html)
[2](https://reference.wolfram.com/language/ref/Multinomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Multinomial_theorem)
