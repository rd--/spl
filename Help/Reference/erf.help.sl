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

>>> [1 / 2, 1.41, 2.sqrt].erf
[0.5205 0.9538 0.9545]

>>> [0 1 2 1.96].erf
[0 0.8427 0.9953 0.9944]
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
>>> 1.5J-1.erf
1.07840J0.027964
```

Maclaurin series for calculating the complex `erf`:

```
>>> let c = 1.5J-1;
>>> (2 / 1.pi.sqrt) * 0:12.sum { :n |
>>> 	let m = (2 * n + 1);
>>> 	((-1 ^ n) * (c ^ m))
>>> 	/
>>> 	(n.factorial * m)
>>> }
1.07840J0.027964
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(erf/1)
~~~

![](Help/Image/erf-A.svg)

Plot a clothoid:

~~~spl svg=B
[-2.25 .. 2.25; 0.025].collect { :t |
	(t + t.i).erf.realImaginary
}.scatterPlot
~~~

![](Help/Image/erf-B.svg)

* * *

See also: erfc, inverseErf

Guides: Special Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Essays/Normal_CDF),
_Mathematica_
[1](https://mathworld.wolfram.com/Erf.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/erf.html),
_W_
[1](https://en.wikipedia.org/wiki/Error_function)

Further Reading: Abramowitz 1964

Categories: Math
