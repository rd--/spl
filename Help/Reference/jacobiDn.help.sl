# jacobiDn

- _jacobiDn(u, m)_

Answer the Jacobi elliptic function _dn(u|m)_.

```
>>> jacobiDn(4, 2 / 3)
0.998883

>>> jacobiDn(3, 1 / 3)
0.966263

>>> jacobiDn(3, 0.3)
0.974279
```

At _m=0_ and _m=1_:

```
>>> let z = 0.65;
>>> (z.jacobiDn(0), z.jacobiDn(1))
(1, z.sech)
```

Plot:

~~~spl svg=A
let m = 1 / 3;
let r = m.ellipticK * 2;
(0 -- r).functionPlot { :x |
	x.jacobiDn(m)
}
~~~

![](sw/spl/Help/Image/jacobiDn-A.svg)

Plot for various _m_:

~~~spl svg=B
(0 -- 8).functionPlot(
	[0.3 0.6 1].collect { :m |
		{ :x |
			x.jacobiDn(m)
		}
	}
)
~~~

![](sw/spl/Help/Image/jacobiDn-B.svg)

Cartesian coordinates of a pendulum:

~~~spl svg=C
let l = 1;
let g = 9.81;
let phi = 1/2.pi;
let a = (phi / 2).sin;
let b = (g / l).sqrt;
let t = (0 -- 10).subdivide(200);
t.collect { :t |
	let c = jacobiSn(t * b, a.square);
	let d = jacobiDn(t * b, a.square);
	let x = 2 * l * a * c * d;
	let y = 0 - (l * (2 * d.square - 1));
	[x, y]
}.pathPlot(t)
~~~

![](sw/spl/Help/Image/jacobiDn-C.svg)

* * *

See also: ellipticK, jacobiCn, jacobiSn

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JacobiEllipticFunctions.html)
[2](https://reference.wolfram.com/language/ref/JacobiCN.html),
_W_
[1](https://en.wikipedia.org/wiki/Jacobi_elliptic_functions)
