# jacobiSn

- _jacobiSn(u, m)_

Answer the Jacobi elliptic function _sn(u|m)_.

```
>>> jacobiSn(2.5, 0.5)
0.890615

>>> jacobiSn(2, 1 / 3)
0.976309

>>> jacobiSn(2, 0.3)
0.971255
```

At _m=0_ and _m=1_:

```
>>> let z = 0.65;
>>> (z.jacobiSn(0), z.jacobiSn(1))
(z.sin, z.tanh)
```

Plot:

~~~spl svg=A
let m = 1 / 3;
let r = m.ellipticK * 4;
(0 -- r).functionPlot { :x |
	x.jacobiSn(m)
}
~~~

![](sw/spl/Help/Image/jacobiSn-A.svg)

Solution of the pendulum equation:

~~~spl svg=B
let alpha = { :phi |
	{ :t |
		let p = sin(phi / 2);
		let q = jacobiSn(t, p ^ 2);
		2 * arcSin(p * q)
	}
};
(0 -- 10).functionPlot(
	[1 / 3, 1 / 2, 99 / 100].pi.collect(
		alpha:/1
	)
)
~~~

![](sw/spl/Help/Image/jacobiSn-B.svg)

Plot with `sin`:

~~~spl svg=C
let m = 0.5.square;
let p = 4 * m.ellipticK;
(0 -- p).functionPlot(
	[
		{ :x | x.sin },
		{ :x | x.jacobiSn(m) }
	]
)
~~~

![](sw/spl/Help/Image/jacobiSn-C.svg)

* * *

See also: ellipticK, jacobiCn, sin

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JacobiEllipticFunctions.html)
[2](https://reference.wolfram.com/language/ref/JacobiSN.html),
_W_
[1](https://en.wikipedia.org/wiki/Jacobi_elliptic_functions)
