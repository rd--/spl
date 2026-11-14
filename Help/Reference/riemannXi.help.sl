# riemannXi

- _riemannXi(z)_

Specific values:

```
>>> riemannXi(2.0)
0.52359

>>> riemannXi(1 / 2)
0.49712

>>> riemannXi(5 / 4)
0.50362

>>> riemannXi(2 / 3)
0.49744

>>> riemannXi(-1.0)
1/6.pi

>>> riemannXi(-11.0)
8.24011

>>> riemannXi(0.0)
1/2
```

At `Complex`:

```
>>> riemannXi(0.5J0.5)
0.494257

>>> riemannXi(4J1)
0.63564J0.10187
```

Threads element‐wise over lists:

```
>>> [0.5 1.5 2.5 3.5].riemannXi
[0.49712 0.50873 0.54509 0.61113]
```

Reflection formula:

```
>>> let z = -3.0;
>>> riemannXi(z)
riemannXi(1.0 - z)
```

Plot over a subset of the reals:

~~~spl svg=A
(-2.0 -- 5.0).functionPlot(
	riemannXi/1
)
~~~

![](Help/Image/riemannXi-A.svg)

* * *

See also: gamma, zeta

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Xi-Function.html)
[2](https://reference.wolfram.com/language/ref/RiemannXi.html),
_W_
[1](https://en.wikipedia.org/wiki/Riemann_xi_function)
