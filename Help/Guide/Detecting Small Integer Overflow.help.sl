# Detecting Small Integer Overflow

The interpreter can check for small integer overflow and either print a warning or signal an error.

The programs here perform calculations involving small integer operations that overflow.

Show _catastrophic cancellation_ in calculating floating point sum of squares,
and compare to correct value obtained by the alternative factoring:

```
>>> let x = 1 + (2 ^ -29);
>>> let y = 1 + (2 ^ -30);
>>> let a = x.square - y.square;
>>> let b = (x + y) * (x - y);
>>> let c = (2 ^ -59) + (2 ^ -60);
>>> let d = a + c;
>>> (a, b, c, d, a.isVeryClose(b))
(
	1.862645149230957E-9,
	1.862645151833042E-9,
	2.602085213965211E-18,
	1.862645151833042E-9,
	false
)

>>> let x = 1L + (2L ^ -29L);
>>> let y = 1L + (2L ^ -30L);
>>> x.square - y.square
2147483651/1152921504606846976
```

Maclaurin series for calculating the error function,
this requires working with very large fractional numbers:

```
>>> let z = 3.5J-2.5;
>>> let c = 2.0 / 1.pi.sqrt;
>>> c * { :n |
>>> 	let m = 2.0 * n + 1.0;
>>> 	let a = ((-1.0 ^ n) * (z ^ m));
>>> 	let b = (n.factorial * m);
>>> 	a / b
>>> }.convergentSeries(0.0)
0.9997653J0.0002203

>>> 3.5J-2.5.erf
0.9997653J0.0002203
```

A zero of the `zeta` function:

```
>>> zeta(0.5J21.022)
0
```

Zeroes of the `riemannXi` function:

```
>>> let t = [
>>> 	14.135 21.022 25.011
>>> 	30.425 32.935 37.586
>>> ];
>>> (0.5 + t.I).riemannXi
[0 0 0 0 0 0]
```

Large _n_ for `fromSignExponentMantissa`:

```
>>> [1.0E100 -1.0E100 1.0E-100 -1.0E-100 Infinity]
>>> .collect { :n |
>>> 	n.signExponentMantissa
>>> 	.fromSignExponentMantissa
>>> }
[1.0E100 -1.0E100 1.0E-100 -1.0E-100 Infinity]
```
