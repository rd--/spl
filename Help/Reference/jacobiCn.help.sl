# jacobiCn

- _jacobiCn(u, m)_

Answer the Jacobi elliptic function _cn(u|m)_.

```
>>> jacobiCn(2.5, 0.3)
-0.62603

>>> jacobiCn(2, 1 / 3)
-0.21638

>>> jacobiCn(2, 0.3)
-0.23804
```

At _m=0_ and _m=1_:

```
>>> let z = 0.65;
>>> (z.jacobiCn(0), z.jacobiCn(1))
(z.cos, z.sech)
```

Plot:

~~~spl svg=A
let m = 1 / 3;
let r = m.ellipticK * 4;
(0 -- r).functionPlot { :x |
	x.jacobiCn(m)
}
~~~

![](sw/spl/Help/Image/jacobiCn-A.svg)

Plot for various _m_:

~~~spl svg=B
(0 -- 4.pi).functionPlot(
	[0 0.5 1 1.5].collect { :m |
		{ :x |
			x.jacobiCn(m)
		}
	}
)
~~~

![](sw/spl/Help/Image/jacobiCn-B.svg)

* * *

See also: ellipticK, jacobiDn, jacobiSn

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JacobiEllipticFunctions.html)
[2](https://reference.wolfram.com/language/ref/JacobiCN.html),
_W_
[1](https://en.wikipedia.org/wiki/Jacobi_elliptic_functions)
