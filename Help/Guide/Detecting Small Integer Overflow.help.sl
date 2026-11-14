# Detecting Small Integer Overflow

The interpreter can warn or error on small integer overflow.

The programs here perform calculations involving small integer operations that overflow.

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
>>> [1E100 -1E100 1E-100 -1E-100 Infinity].collect { :n |
>>> 	n.signExponentMantissa
>>> 	.fromSignExponentMantissa
>>> }
[1E100 -1E100 1E-100 -1E-100 Infinity]
```
