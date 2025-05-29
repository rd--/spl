# inverseErfc

- _inverseErfc(x)_

Answer the inverse complementary error function.

At specific values:

```
>>> 0.6.inverseErfc
0.3708

>>> 0.3708.erfc
0.6

>>> 0.33.inverseErfc
0.6888

>>> 0.6888.erfc
0.33

>>> 0.3.inverseErfc
0.7329

>>> 0.7329.erfc
0.3

>>> 0.5.inverseErfc
0.4769

>>> 0.4769.erfc
0.5
```

Threads over lists:

```
>>> [0 0.5 1 1.3 2].inverseErfc
[Infinity 0.47694 0 -0.27246 -Infinity]

>>> [0.1 1.2; 1 0.9].inverseErfc
[
	1.16309 -0.17914;
	0        0.08886
]
```

Plot over range:

~~~spl svg=A
(0 -- 2).functionPlot { :x |
	x.inverseErfc.clip([-2 2])
}
~~~

![](sw/spl/Help/Image/inverseErfc-A.svg)

Generate Gaussian-distributed random numbers:

~~~spl svg=B
Sfc32(789141)
.randomReal([0 2], [67])
.inverseErfc
.discretePlot
~~~

![](sw/spl/Help/Image/inverseErfc-B.svg)

Avoid round-off errors using inverse complementary error function:

```
>>> (1 - 1E-100).inverseErf
Infinity

>>> 1E-100.inverseErfc
15.0656
```

* * *

See also: erf, erfc, inverseCdf, inverseErf, NormalDistribution

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseErfc.html)
[2](https://reference.wolfram.com/language/ref/InverseErfc.html)
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/erfcinv.html)
_W_
[1](https://en.wikipedia.org/wiki/Error_function)
