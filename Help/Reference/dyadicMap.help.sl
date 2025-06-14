# dyadicMap

- _dyadicMap(β)_

The dyadic map,
also known as the dyadic transformation,
is a special case of the beta transformation,
where _β=2_.

Plot small iteration count where _β=2_ and _x₀=0.11_:

~~~spl svg=A
dyadicMap(2)
.nestList(0.11, 50)
.linePlot
~~~

![](sw/spl/Help/Image/dyadicMap-A.svg)

Plot small iteration count where _β=2_ and _x₀=-3+π_:

~~~spl svg=B
dyadicMap(2)
.nestList(-3 + 1.pi, 50)
.linePlot
~~~

![](sw/spl/Help/Image/dyadicMap-B.svg)

* * *

See also: logisticMap, tentMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/2xmod1Map.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyadic_transformation)
