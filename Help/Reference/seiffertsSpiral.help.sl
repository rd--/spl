# seiffertsSpiral

- _seiffertsSpiral(m)_

Answer the parametric equation for Seiffert’s spherical spiral.

Plot with _m=0.8_:

~~~spl svg=A
let m = 0.8;
(0 -- 2.87.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

![](sw/spl/Help/Image/seiffertsSpiral-A.svg)

A closed spiral, _n=1_ and _p=4_:

~~~spl svg=B
let m = 0.060584;
(0 -- 8.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

The spiral will be closed if the following equation holds:

```
>>> let m = 0.060584;
>>> let n = 1;
>>> let p = 4;
>>> m.ellipticK * m.sqrt * (2 / 1.pi)
n / p
```

![](sw/spl/Help/Image/seiffertsSpiral-B.svg)

A closed spiral, _n=1_ and _p=1_:

~~~spl svg=C
let m = 0.628415;
(0 -- 2.5.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

![](sw/spl/Help/Image/seiffertsSpiral-C.svg)

A closed spiral, _n=4_ and _p=1_:

~~~spl svg=D
let m = 0.999944;
(0 -- 8.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

![](sw/spl/Help/Image/seiffertsSpiral-D.svg)

A closed spiral with _m>1_,
so that the spiral is located entirely in the northern hemisphere,
where _p=4_ and _n=1_:

~~~spl svg=E
let m = 1.0000558096;
(0 -- 4.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

![](sw/spl/Help/Image/seiffertsSpiral-E.svg)

A closed spiral, _n=2_ and _p=3_:

~~~spl svg=F
let m = 0.358;
(0 -- 7.pi).functionPlot(
	400,
	m.seiffertsSpiral
)
~~~

![](sw/spl/Help/Image/seiffertsSpiral-F.svg)

_Note:_
The equation is that given by Erdős,
which is slightly different to that given in the references.

* * *

See also: jacobiCn, jacobiSn, sphericalSpiral

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SeiffertsSphericalSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Seiffert%27s_spiral)

Further Reading: Erdős 2000
