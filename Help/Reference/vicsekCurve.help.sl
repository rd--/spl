# vicsekCurve

- _vicsekCurve(n)_

Answer the line segments representing the _n_-th step Vicsek curve.

Lengths of successive approximations to the Vicsek curve:

```
>>> 1:3.collect { :n |
>>> 	n.vicsekCurve.size
>>> }
[21 101 501]
```

Drawing of the 2nd step of the Vicsek curve:

~~~spl svg=A
2.vicsekCurve.Line
~~~

![](sw/spl/Help/Image/vicsekCurve-A.svg)

Drawing of the 3rd step of the Vicsek curve:

~~~spl svg=B
3.vicsekCurve.Line
~~~

![](sw/spl/Help/Image/vicsekCurve-B.svg)

* * *

See also: sierpinskiCurve, simpleLindenmayerSystem, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BoxFractal.html),
_W_
[1](https://en.wikipedia.org/wiki/Vicsek_fractal)

