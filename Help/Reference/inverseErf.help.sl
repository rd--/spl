# inverseErf

- _inverseErf(s)_

Answer the inverse "error function" obtained as the solution for _z_ in _s = erf(z)_.

```
>>> 0.6.inverseErf
0.595116

>>> 0.595116.erf
0.6

>>> 0.33.inverseErf
0.301332

>>> 0.301332.erf
0.33

>>> 0.25.inverseErf
0.2253

>>> 0.2253.erf
0.25

>>> 0.7.inverseErf
0.732869

>>> 0.732869.erf
0.7

>>> 0.9.inverseErf
1.1631

>>> 1.1631.erf
0.9
```

Threads over lists:

```
>>> (1 / [2 3 4 5]).inverseErf
[0.47694 0.30457 0.22531 0.17914]

>>> [0.47694 0.30457 0.22531 0.17914].erf
(1 / [2 3 4 5])

>>> [0 -0.5; 0.9 -0.2].inverseErf
[
	0       -0.47694;
	1.16309 -0.17914
]
```

At `one` and `zero` and negative `one`:

```
>>> [-1 0 1].inverseErf
[-Infinity 0 Infinity]

>>> [-Infinity 0 Infinity].erf
[-1 0 1]
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.99 -- 0.99).functionPlot(inverseErf:/1)
~~~

![](sw/spl/Help/Image/inverseErf-A.svg)

* * *

See also: erf, erfc, inverseErfc

Guides: Special Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseErf.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/erfinv.html)
