# inverseFourier

- _inverseFourier([z₁ z₂ …])_

Answer the discrete inverse Fourier transform of a list of complex numbers.

Inverse Fourier transform of a real list:

```
>>> [1 0 1 1 0 1 1 1 0 1 1 1 1]
>>> .inverseFourier
[
	+2.773501J+0.000000
	+0.060368J+0.204301
	+0.016616J+0.319665
	-0.436565J-0.081818
	+0.334210J+0.601029
	+0.231310J+0.246434
	+0.210088J-0.421207
	+0.210088J+0.421207
	+0.231310J-0.246434
	+0.334210J-0.601029
	-0.436566J+0.081818
	+0.016616J-0.319665
	+0.060368J-0.204301
]

>>> [1 .. 6].inverseFourier
[
	+8.5732J+0.0000
	-1.2247J+2.1213
	-1.2247J+0.7071
	-1.2247J+0.0000
	-1.2247J-0.7071
	-1.2247J-2.1213
]
```

Inverse Fourier transform of a complex list:

```
>>> [1J2 3J4].inverseFourier
[2.828427J4.242641 -1.414214J-1.414214]
```

The inverse Fourier is equivalent to multiplication with the Fourier matrix with specified parameters:

```
>>> let m = 6.fourierMatrix([0 -1]);
>>> let v = [1 .. 6];
>>> m.dot(v)
v.inverseFourier
```

The conjugate transpose of the matrix is equivalent to Fourier:

```
>>> let m = 6.fourierMatrix([0 -1]);
>>> let v = [1 .. 6];
>>> m.conjugateTranspose.dot(v)
v.fourier
```

* * *

See also: fourier, fourierMatrix, ifft

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseFourier.html)
