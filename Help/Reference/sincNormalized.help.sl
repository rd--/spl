# sincNormalized

- _sincNormalized(z)_

The normalized sinc function.

_sincNormalized(z)_ is equivalent to _sincHistorical(zπ)_,
which is equivalent to _sin(zπ)/zπ_,
except at zero where it is one.

```
>>> 0.5.sincNormalized
2 / 1.pi

>>> 1/2.pi.sincHistorical
2 / 1.pi

>>> 0.5.pi.sin / 0.5.pi
2 / 1.pi
```

Threads elementwise over lists and matrices:

```
>>> (1 / [2 3 4]).sincNormalized
[
	2 / 1.pi,
	3 * 3.sqrt / 2.pi,
	2 * 2.sqrt / 1.pi
]
```

Plot:

~~~spl svg=A
(-10, -9.9 .. 10).sincNormalized.linePlot
~~~

![](sw/spl/Help/Image/sincNormalized-A.svg)

Perform ideal bandlimited interpolation of a random signal sampled at integer spacings.
Assume that the signal to interpolate,
_x_,
is `zero` outside of the given time interval,
and has been sampled at the Nyquist frequency:

~~~spl svg=B
let r = Sfc32(367821);
let t = [1 .. 10];
let d = NormalDistribution(0, 1);
let x = d.randomVariate(r, [t.size 1]);
let ts = (-5 -- 15).discretize(600);
let tsM = List(t.size, ts).transpose;
let tM = List(ts.size, t);
let y = (tsM - tM).sincNormalized.dot(x);
[ts, y.collect(first:/1)].transpose.linePlot
~~~

![](sw/spl/Help/Image/sincNormalized-B.svg)

* * *

See also: sin, sincHistorical

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SincFunction.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/sinc.html),
_W_
[1](https://en.wikipedia.org/wiki/Sinc_function)

Categories: Math, Trigonometry
