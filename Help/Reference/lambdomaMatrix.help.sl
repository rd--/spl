# lambdomaMatrix

- _lambdomaMatrix(m, n)_

Answer the _m×n_ lambdoma matrix.
Rows are harmonic series, columns are subharmonic series.

The 9×9 matrix:

```
>>> [9 9].lambdomaMatrix
[
	1/1 2/1 3/1 4/1 5/1 6/1 7/1 8/1 9/1;
	1/2 1/1 3/2 2/1 5/2 3/1 7/2 4/1 9/2;
	1/3 2/3 1/1 4/3 5/3 2/1 7/3 8/3 3/1;
	1/4 1/2 3/4 1/1 5/4 3/2 7/4 2/1 9/4;
	1/5 2/5 3/5 4/5 1/1 6/5 7/5 8/5 9/5;
	1/6 1/3 1/2 2/3 5/6 1/1 7/6 4/3 3/2;
	1/7 2/7 3/7 4/7 5/7 6/7 1/1 8/7 9/7;
	1/8 1/4 3/8 1/2 5/8 3/4 7/8 1/1 9/8;
	1/9 2/9 1/3 4/9 5/9 2/3 7/9 8/9 1/1
]
```

Setting _1/1_ to _256Hz_ and rounding to nearest integer:

```
>>> ([10 7].lambdomaMatrix * 256).round
[
	256 512 768 1024 1280 1536 1792;
	128 256 384  512  640  768  896;
	 85 171 256  341  427  512  597;
	 64 128 192  256  320  384  448;
	 51 102 154  205  256  307  358;
	 43  85 128  171  213  256  299;
	 37  73 110  146  183  219  256;
	 32  64  96  128  160  192  224;
	 28  57  85  114  142  171  199;
	 26  51  77  102  128  154  179
]
```

Log scale matrix plot of _12×12_ matrix:

~~~spl svg=A
[12 12].lambdomaMatrix
.logScale
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-A.svg)

Matrix plot of the numerators of the _12×12_ matrix:

~~~spl svg=B
[12 12].lambdomaMatrix
.numerator
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-B.svg)

Matrix plot of the denominators of the _12×12_ matrix:

~~~spl svg=C
[12 12].lambdomaMatrix
.denominator
.matrixPlot
~~~

![](sw/spl/Help/Image/lambdomaMatrix-C.svg)

Colour plot of the 16×16 matrix in octave reduced form:

~~~spl svg=D
let m = [16 16].lambdomaMatrix;
(2 - m.octaveReduce)
.arrayPlot(
	'Mathematica/Rainbow'
	.namedColourFunction
)
~~~

![](sw/spl/Help/Image/lambdomaMatrix-D.svg)

Colour directly as hue value:

~~~spl svg=E
[16 16].lambdomaMatrix
.octaveReduce
.arrayPlot { :x |
	HsvColour([x 0.8 0.8], 1)
}
~~~

![](sw/spl/Help/Image/lambdomaMatrix-E.svg)

* * *

See also: Fraction, swap, table

Guides: Matrix Functions

Further Reading: Hero 1999
