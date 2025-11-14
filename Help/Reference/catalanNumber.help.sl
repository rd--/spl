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
>>> let a = (4 ^ n) * gamma(n + 0.5);
>>> let b = 1.pi.sqrt * gamma(n + 2);
>>> a / b
4862
```

Partial sums of Catalan numbers,
OEIS [A014137](https://oeis.org/A014137):

```
>>> 0:14.collect(catalanNumber:/1)
>>> .accumulate
[
	1 2 4 9 23 65 197 626 2056 6918
	23714 82500 290512 1033412 3707852
]
```

* * *

See also: bellNumber, binomial, catalanTriangle, dyckWords, factorial, gamma, lassalleNumber, superCatalanNumber

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalanNumber.html)
[2](https://reference.wolfram.com/language/ref/CatalanNumber.html),
_OEIS_
[1](https://oeis.org/A000108)
[2](https://oeis.org/A014137)
[3](https://oeis.org/A014138),
_W_
[1](https://en.wikipedia.org/wiki/Catalan_number)

Categories: Math, Combinatorics
