# catalanNumber

- _catalanNumber(n)_

Answer the _n_-th Catalan number.
The Catalan numbers are a sequence of natural numbers that occur in various counting problems,
often involving recursively defined objects.

The first eleven Catalan numbers:

```
>>> 0:10.collect(catalanNumber:/1)
[1 1 2 5 14 42 132 429 1430 4862 16796]
```

Definition in terms of `factorial`:

```
>>> let n = 9;
>>> (2 * n).! / n.! / (n + 1).!
4862
```

Definition in terms of `gamma`:

```
>>> let n = 9;
>>> (4 ^ n) * gamma(n + 0.5) / (1.pi.sqrt * gamma(n + 2))
4862
```

* * *

See also: bellNumber, binomial, catalanTriangle, dyckWords, factorial, gamma, lassalleNumber, superCatalanNumber

Guides: Combinatorial Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalanNumber.html)
[2](https://reference.wolfram.com/language/ref/CatalanNumber.html),
_OEIS_
[1](https://oeis.org/A000108),
_W_
[1](https://en.wikipedia.org/wiki/Catalan_number)

Categories: Math, Combinatorics
