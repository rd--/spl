# catalanNumber

- _catalanNumber(n)_

Answer the _n_-th Catalan number _C(n)_.
The Catalan numbers are a sequence of natural numbers that occur in various counting problems,
often involving recursively defined objects.

The first eleven Catalan numbers:

```
>>> 0:10.collect(catalanNumber:/1)
[1 1 2 5 14 42 132 429 1430 4862 16796]
```

Threads over lists:

```
>>> 0:10.catalanNumber
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
>>> 0:14.catalanNumber.accumulate
[
	1 2 4 9 23 65 197 626 2056 6918
	23714 82500 290512 1033412 3707852
]
```

The largest Catalan number _≤n_,
OEIS [A081290](https://oeis.org/A081290):

```
>>> let c = 0:14.catalanNumber;
>>> let r = c.reverse;
>>> 0:73.collect { :n |
>>> 	r.detectIfNone { :x |
>>> 		x <= n
>>> 	} {
>>> 		0
>>> 	}
>>> }
[
	 0  1  2  2  2  5  5  5  5  5
	 5  5  5  5 14 14 14 14 14 14
	14 14 14 14 14 14 14 14 14 14
	14 14 14 14 14 14 14 14 14 14
	14 14 42 42 42 42 42 42 42 42
	42 42 42 42 42 42 42 42 42 42
	42 42 42 42 42 42 42 42 42 42
	42 42 42 42
]
```

The largest _k_ such that _k_-th Catalan number is _≤n_,
OEIS [A244160](https://oeis.org/A244160):

```
>>> 0:6.catalanNumber
>>> .differences
>>> .withIndexCollect { :x :i |
>>> 	List(x, i - 1)
>>> }.catenate
[0 1 3 9 28 90] # [0 1 2 3 4 5]
```

Repeat _n_ _C(n)_ times,
OEIS [A072643](https://oeis.org/A072643):

```
>>> 0:6.collect { :n |
>>> 	List(n.catalanNumber, n)
>>> }.catenate
0:6.catalanNumber # 0:6
```

Expansion of _√(1-4*x)_ in powers of _x_,
OEIS [A002420](https://oeis.org/A002420):

```
>>> 1:10.collect { :n |
>>> 	-2 * (n - 1).catalanNumber
>>> }
[-2 -2 -4 -10 -28 -84 -264 -858 -2860 -9724]
```

* * *

See also: bellNumber, binomial, catalanTriangle, dyckWords, factorial, fussCatalanNumber, gamma, lassalleNumber, superCatalanNumber

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalanNumber.html)
[2](https://reference.wolfram.com/language/ref/CatalanNumber.html),
_OEIS_
[1](https://oeis.org/A000108)
[2](https://oeis.org/A014137)
[3](https://oeis.org/A014138)
[4](https://oeis.org/A081290),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.catalan),
_W_
[1](https://en.wikipedia.org/wiki/Catalan_number)

Categories: Math, Combinatorics
