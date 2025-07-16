# binetsFormula

- _binetsFormula(n)_

Answer the _n_-th Fibonacci number calculated using Binet’s formula.

The first twenty Fibonacci numbers:

```
>>> 1:20.collect(binetsFormula:/1)
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987 1597 2584 4181 6765
]
```

C.f. `fibonacci`:

```
>>> 1:20.fibonacci
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987 1597 2584 4181 6765
]
```

Note loss of precision for large values:

```
>>> 100.fibonacci
354224848179262260000

>>> 100.fibonacciSequence.last
354224848179261915075L
```

* * *

See also: fibonacci

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinetsFormula.html)
