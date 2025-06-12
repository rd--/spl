# pseudoInverse

- _pseudoInverse(m)_

Answer the pseudoinverse of the rectangular matrix _m_,
calculated in terms of the `singularValueDecomposition`.

Find the pseudoinverse of an invertible 2×2 integer matrix:

```
>>> [1 2; 3 4].pseudoInverse
[-2 1; 1.5 -0.5]
```

The pseudoinverse is merely the inverse:

```
>>> [1 2; 3 4].inverse
[-2 1; 1.5 -0.5]
```

Find the pseudoinverse of a singular matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].pseudoInverse
[
	[-23  -6  11] / 36,
	[ -1   0   1] / 18,
	[ 19   6  -7] / 36
]
```

Find the pseudoinverse of an invertible 3×3 integer matrix:

```
>>> [
>>> 	1  2  3;
>>> 	1  4  9;
>>> 	1  8 27
>>> ].pseudoInverse
[
	 3   -5/2  1/2;
	-3/2  2   -1/2;
	 1/3 -1/2  1/6
]
```

The pseudoinverse is merely the inverse:

```
>>> [
>>> 	1  2  3;
>>> 	1  4  9;
>>> 	1  8 27
>>> ].inverse
[
	 3   -5/2  1/2;
	-3/2  2   -1/2;
	 1/3 -1/2  1/6
]
```

Find the pseudoinverse of an invertible 3×3 real matrix:

```
>>> [
>>> 	0.942 0.409 0.676;
>>> 	0.305 0.24 0.249;
>>> 	0.307 0.813 0.357
>>> ].pseudoInverse
[
	 21.4737   -74.2246    11.1085;
	  5.9667   -23.6816     5.2192;
	-32.0541   117.7594   -18.6373
]
```

The inverse, and also pseudoinverse of an identity matrix:

```
>>> 3.identityMatrix.pseudoInverse
3.identityMatrix
```

Find the pseudoinverse of a machine-precision matrix:

```
>>> [
>>> 	1.25  3.20  3.20;
>>> 	7.90 -1.40  5.10;
>>> 	0.00  0.00  0.00
>>> ].pseudoInverse
[
	-0.03852  0.09666 0;
	 0.21018 -0.06599 0;
	 0.11736  0.02823 0
]
```

* * *

See also: inverse, Matrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PseudoInverse.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/pinv.html)
