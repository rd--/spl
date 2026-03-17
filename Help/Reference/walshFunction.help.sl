# walshFunction

- _walshFunction(n, k)_

Answer the _k_-th Walsh function of length _2^n_,
which is the _k_-th row of the _2^n_ Walsh matrix.

The _1,1_ Walsh function:

```
>>> walshFunction(1, 1)
[1 1]

>>> (2 ^ 1).walshMatrix.at(1)
[1 1]
```

The _2,4_ Walsh function:

```
>>> walshFunction(2, 4)
[1 -1 1 -1]

>>> (2 ^ 2).walshMatrix.at(4)
[1 -1 1 -1]
```

The _3,6_ Walsh function:

```
>>> walshFunction(3, 6)
[1 -1 -1 1 -1 1 1 -1]

>>> (2 ^ 3).walshMatrix.at(6)
[1 -1 -1 1 -1 1 1 -1]
```

The four _n=2_ Walsh functions:

~~~spl svg=A
let n = 2;
let m = 2 ^ n;
1:m.collect { :k |
	walshFunction(n, k)
}.catenate.stepPlot
~~~

![](Help/Image/walshFunction-A.svg)

The eight _n=3_ Walsh functions:

~~~spl svg=B
let n = 3;
let m = 2 ^ n;
1:m.collect { :k |
	walshFunction(n, k)
}.catenate.stepPlot
~~~

![](Help/Image/walshFunction-B.svg)

The sixteen _n=4_ Walsh functions,
replacing negative one with zero:

~~~spl svg=C
let n = 4;
let m = 2 ^ n;
1:m.collect { :k |
	walshFunction(n, k)
}.catenate.max(0)
.discretePlot
~~~

![](Help/Image/walshFunction-C.svg)

Concatenating the Walsh functions _W(n-1,⌈2^n/3)_ gives the Thue-Morse sequence:

~~~spl svg=D
2:7.collect { :n |
	(n - 1).walshFunction(
		(2 ^ n / 3).ceiling
	)
}.catenate.max(0).discretePlot
~~~

![](Help/Image/walshFunction-D.svg)

The _n=4_ Walsh functions in Gray decoded sequence,
called the dyadic or Paley ordering:

~~~spl svg=E
let n = 4;
let m = 2 ^ n - 1;
0:m.collect { :k |
	n.walshFunction(
		k.grayDecode + 1
	).max(0)
}.matrixPlot
~~~

![](Help/Image/walshFunction-E.svg)

* * *

See also: hadamardMatrix, walshMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WalshFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Walsh_function)
