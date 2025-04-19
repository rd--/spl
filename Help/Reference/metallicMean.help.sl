# metallicMean

- _metallicMean(anInteger)_

The metallic mean,
also called the metallic ratio or noble mean,
of an integer _n_ is the number with the continued fraction _[n;n,n,n,n...]_.

The first five metallic means:

```
>>> 1:5.collect(metallicMean:/1)
[
	1.61803
	2.41421
	3.30278
	4.23607
	5.19258
]
```

The first metallic mean is the `goldenRatio`:

```
>>> let n = 1;
>>> (
>>> 	1.goldenRatio,
>>> 	(n + (n.squared + 4).sqrt) / 2
>>> )
(1.618, 1.618)
```

The second metallic mean is the `silverRatio`:

```
>>> let n = 2;
>>> (
>>> 	1.silverRatio,
>>> 	(n + (n.squared + 4).sqrt) / 2
>>> )
(2.4142, 2.4142)
```

The continued fractions of the first five metallic means:

```
>>> 1:5.collect{ :each |
>>> 	each
>>> 	.metallicMean
>>> 	.continuedFraction(9)
>>> }
[
	1 1 1 1 1 1 1 1 1;
	2 2 2 2 2 2 2 2 2;
	3 3 3 3 3 3 3 3 3;
	4 4 4 4 4 4 4 4 4;
	5 5 5 5 5 5 5 5 5
]
```

* * *

See also: continuedFraction, goldenRatio, silverRatio, supergoldenRatio

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilverRatio.html),
_OEIS_
[1](https://oeis.org/A001622)
[2](https://oeis.org/A014176)
[3](https://oeis.org/A098316)
[4](https://oeis.org/A098317)
[5](https://oeis.org/A098318),
_W_
[1](https://en.wikipedia.org/wiki/Metallic_mean)

Categories: Math, Constant
