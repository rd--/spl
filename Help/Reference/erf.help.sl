# erf

- _erf(z)_

Answer the "error function", encountered in integrating the normal distribution.

The error function near `one`:

```
>>> 0.9.erf
0.7969

>>> 0.95.erf
0.8209
```

The generalised error function:

```
>>> 2.erf - 1.5.erf
0.029217
```

Threads elementwise over lists:

```
>>> [0.5 1 1.5].erf
[0.5205 0.8427 0.9661]

>>> [0.76 1.41 2.sqrt].erf
[0.7175 0.9538 0.9545]

>>> [0 1 2 1.96].erf
[0 0.8427 0.9953 0.9944]

>>> [-0.5 0 1 0.72].erf
[-0.5205 0 0.8427 0.6914]

>>> [0.29 -0.11; 3.1 -2.9].erf
[
	0.31828   -0.12362;
	1.00000   -1.00000
]
```

At `zero` and `Infinity`:

```
>>> 0.erf
0

>>> Infinity.erf
1
```

At `Complex`:

```
>>> 1J1.erf
1.31615J0.19045

>>> 1.5J-1.erf
1.07840J0.027964
```

Maclaurin series for calculating the `erf`:

```
>>> 0.5.erfMaclaurinSeries(32, 1E-16)
0.5205

>>> 1.5J-1.erfMaclaurinSeries(32, 1E-16)
1.07840J0.027964
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(erf/1)
~~~

![](Help/Image/erf-A.svg)

Plot a clothoid:

~~~spl svg=B
[-2.5 .. 2.5; 0.025].collect { :t |
	(t + t.i).erf
}.complexListPlot
~~~

![](Help/Image/erf-B.svg)

Plot the cumulative distribution function of the normal distribution with μ=0 and σ=1:

~~~spl svg=C
(-3 -- 3).functionPlot { :x |
	(1 + erf(x / 2.sqrt)) / 2
}
~~~

![](Help/Image/erf-C.svg)

Plot the solution of the heat equation at time _t_:

~~~spl svg=D
let t = 0.1;
let a = 5;
let k = 2;
let b = 1;
(-4 -- 6).functionPlot { :x |
	(a / 2) * (erf((x - b) / sqrt(4 * k * t)))
}
~~~

![](Help/Image/erf-D.svg)

Complex plot:

~~~spl png=E
[-3J-3 3J3].complexPlot(erf/1)
~~~

![](Help/Image/erf-E.png)

* * *

See also: erfc, inverseErf

Guides: Special Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/Erf.html)
[2](https://reference.wolfram.com/language/ref/Erf.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/erf.html),
_W_
[1](https://en.wikipedia.org/wiki/Error_function)

Further Reading: Abramowitz 1964

Categories: Math
