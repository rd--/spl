# lucasL

- _lucasL(n, x)_

Answer Lucas number _Lₙ(x)_.

Values at fixed points:

```
>>> 1:5.collect { :x |
>>> 	10.lucasL(x)
>>> }
[123 6726 154451 1860498 14250627]
```

Values at `zero`:

```
>>> 1.lucasL(0)
0

>>> 0.lucasL(0)
2
```

Non-integer _x_:

```
>>> 2.lucasL(1.73205)
5
```

Numbers having three ones in their base-phi representation,
OEIS [A104626](https://oeis.org/A104626):

```
>>> 4:23.collect { :n |
>>> 	lucasL(2 * n - 4, 1) + 1
>>> }
[
	8 19 48 124 323 844 2208 5779 15128
	39604 103683 271444 710648 1860499
	4870848 12752044 33385283 87403804
	228826128 599074579
]
```

Bisection of Lucas numbers,
OEIS [A005248](https://oeis.org/A005248):

```
>>> 0:42:2.lucasL(1)
[
	2 3 7 18 47 123 322 843 2207 5778
	15127 39603 103682 271443 710647
	1860498 4870847 12752043 33385282
	87403803 228826127 599074578
]
```

Plot the for various orders:

~~~spl svg=A
(-2 -- 2).functionPlot(
	1:4.collect { :n |
		{ :x |
			n.lucasL(x).min(14)
		}
	}
)
~~~

![](sw/spl/Help/Image/lucasL-A.svg)

Integer _n_ with _x=3_,
OEIS [A006497](https://oeis.org/A006497);

```
>>> 0:12.collect { :n |
>>> 	n.lucasL(3)
>>> }
[
	2 3 11 36 119 393 1298 4287 14159
	46764 154451 510117 1684802
]

>>> linearRecurrence([3 1], [2 3], 10)
[2 3 11 36 119 393 1298 4287 14159 46764]
```

Negative _n_:

```
>>> -11.lucasL(1)
-199
```

* * *

See also: lucasNumber, lucasPolynomial, lucasSequence
