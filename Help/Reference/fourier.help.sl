# fourier

- _fourier([z₁ z₂ …])_

Answer the discrete Fourier transform of a list of complex numbers.
The zero frequency term appears at position one in the resulting list.

The discrete Fourier transform:

```
>>> [1 1 2 2 1 1 0 0].fourier
[
	+2.82843J+0.00000
	-0.50000J+1.20711
	+0.00000J+0.00000
	+0.50000J-0.20711
	+0.00000J+0.00000
	+0.50000J+0.20711
	+0.00000J+0.00000
	-0.50000J-1.20711
]

>>> [1 0 0 1 0 0 1].fourier
[
	+1.133893J+0.000000,
	+0.273087J-0.131512,
	+0.529516J-0.663993,
	-0.046675J+0.204495,
	-0.046675J-0.204495,
	+0.529516J+0.663993,
	+0.273087J+0.131512
]
```

The power spectrum:

```
>>> [1 1 2 2 1 1 0 0].fourier.abs.square
[
	8.00000,
	1.70711,
	0.00000,
	0.29290,
	0.00000,
	0.29290,
	0.00000,
	1.70711
]
```

Fourier spectrum of white noise:

~~~spl svg=A
Sfc32(235617)
.randomReal([0 1], 100)
.fourier
.allButFirst
.abs
.square
.linePlot
~~~

![](sw/spl/Help/Image/fourier-A.svg)

Show the logarithmic spectrum, including the first (zero-frequency) component:

~~~spl svg=B
Sfc32(235617)
.randomReal([0 1], 100)
.fourier
.abs
.square
.log(10)
.linePlot
~~~

![](sw/spl/Help/Image/fourier-B.svg)

The spectrum of an impulse is completely flat:

```
>>> [1].padRight([49], 0)
>>> .fourier
>>> .abs
>>> .minMax
[0.14286 0.14286]
```

Power spectrum of the Thue–Morse sequence:

~~~spl svg=C
125.thueMorseSequence
.fourier
.allButFirst
.abs
.linePlot
~~~

![](sw/spl/Help/Image/fourier-C.svg)

The Fourier transform is equivalent to multiplication with a `fourierMatrix`:

```
>>> [1 .. 6].fourier
6.fourierMatrix.dot([1 .. 6])

>>> [1 .. 6].fourier
[
	+8.57321J+0.00000
	-1.22474J-2.12132
	-1.22474J-0.70711
	-1.22474J+0.00000
	-1.22474J+0.70711
	-1.22474J+2.12132
]
```

* * *

See also: fourierMatrix, fft, inverseFourier

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fourier.html)
