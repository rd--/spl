# zeta

- _zeta(s)_

Answer the Riemann zeta function _ζ(s)_,
the generalization of the harmonic series.

```
>>> zeta(2)
(1.pi ^ 2) / 6

>>> zeta(4)
(1.pi ^ 4) / 90

>>> zeta(5 / 4)
4.59511

>>> zeta(5.2111)
1.03139

>>> zeta(4.61297)
1.05

>>> zeta(1/2)
-1.46035
```

Threads over lists:

```
>>> zeta([0.7 0J1 4 11/3])
[
	-2.778388
	0.00330J-0.41816
	1.08232
	1.10941
]
```

At negative integers:

```
>>> -7:-1.zeta
[1/240 0 -1/252 0 1/120 0 -1/12]
```

Value at `zero` and `one`:

```
>>> zeta(0)
-0.5

>>> zeta(1)
Infinity
```

Some zeroes:

```
>>> zeta(-2)
0

>>> zeta(0.5J21.022)
0

>>> zeta(0.5J40.9187)
0
```

At `Complex`:

```
>>> zeta(2J2)
0.8673J-0.2751

>>> zeta(0.5J0.5)
-0.459303J-0.961254

>>> zeta(1.2J3.7)
0.6920526J0.0005443

>>> zeta(0.8J-2.5)
0.563654J0.204752
```

The fraction of pairs of the first 100 integers that are relatively prime:

```
>>> isCoprime:/2.table(1:100, 1:100)
>>> .catenate.boole.mean
0.6087

>>> 1 / zeta(2)
0.60792
```

Euler’s product formula:

```
>>> let k = 99;
>>> let s = 3;
>>> k.primesList.collect { :n |
>>> 	1 - (1 / (n ^ s))
>>> }.product./
1.202057

>>> zeta(3)
1.202057
```

Riemann’s functional equation:

```
>>> let s = 2.5;
>>> [
>>> 	2 ^ s,
>>> 	1.pi ^ (s - 1),
>>> 	(s.pi / 2).sin,
>>> 	(1 - s).gamma,
>>> 	(1 - s).zeta
>>> ].product
zeta(s)
```

Reflection formula:

```
>>> let z = 2J2;
>>> [
>>> 	(2 * z.gamma) / (2.pi ^ z),
>>> 	(1/2.pi * z).cos,
>>> 	zeta(z)
>>> ].product
zeta(1 - z)
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot { :z |
	zeta(z).clip([-3 4])
}
~~~

![](sw/spl/Help/Image/zeta-A.svg)

Plot the real part of the zeta function on the critical line:

~~~spl svg=B
(1 -- 50).functionPlot { :t |
	zeta(0.5 + t.i).real
}
~~~

![](sw/spl/Help/Image/zeta-B.svg)

Plot the zeta function on the critical line:

~~~spl svg=C
(0.75 -- 23).functionPlot { :t |
	zeta(0.5 + t.i)
}
~~~

![](sw/spl/Help/Image/zeta-C.svg)

* * *

See also: harmonicNumber, primePi

Guides: Special Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/RiemannZetaFunction.html)
[2](https://reference.wolfram.com/language/ref/Zeta.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.zeta.html),
_NIST_
[1](https://dlmf.nist.gov/25),
_W_
[1](https://en.wikipedia.org/wiki/Riemann_zeta_function)

Unicode: U+03B6 ζ Greek Small Letter Zeta

