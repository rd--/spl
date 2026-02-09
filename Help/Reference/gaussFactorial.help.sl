# gaussFactorial

- _gaussFactorial(m, n=m)_

Answer the Gauss factorial.
In the unary case _n=m_.

First few terms,
OEIS [A001783](https://oeis.org/A001783):

```
>>> 1:23.collect(gaussFactorial:/1)
[
	1
	1
	2
	3
	24
	5
	720
	105
	2240
	189
	3628800
	385
	479001600
	19305
	896896
	2027025
	20922789888000
	85085
	6402373705728000
	8729721
	47297536000
	1249937325
	1124000727777607680000L
]
```

Plot first few terms:

~~~spl svg=A
1:99.collect(gaussFactorial:/1)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/gaussFactorial-A.svg)

The 2-adic factorial function,
also known as Morita’s 2-adic gamma function,
OEIS [A055634](https://oeis.org/A055634):

```
>>> 0:23.collect { :n |
>>> 	(-1 ^ n) * n.gaussFactorial(2)
>>> }
[
	1
	-1
	1
	-3
	3
	-15
	15
	-105
	105
	-945
	945
	-10395
	10395
	-135135
	135135
	-2027025
	2027025
	-34459425
	34459425
	-654729075
	654729075
	-13749310575
	13749310575
	-316234143225
]
```

Plot:

~~~spl svg=B
0:99.collect { :n |
	(-1 ^ n) * n.gaussFactorial(2)
}.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/gaussFactorial-B.svg)

* * *

See also: isCoprime, product

References:
_OEIS_
[1](https://oeis.org/A001783)
