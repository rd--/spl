# sech

- _sech(z)_

Answer the hyperbolic secant of _z_.

```
>>> 1.8.sech
0.321805
```

At `Complex`:

```
>>> 2.5J1.sech
0.089799J-0.137981

>>> 1/3.pi.i.sech
2
```

At `zero` and infinity:

```
>>> 0.sech
1

>>> Infinity.sech
0
```

At `List`:

```
>>> [0 1 2 3].pi.sech
[1 0.0862667 0.0037349 0.0001614]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(sech:/1)
~~~

![](sw/spl/Help/Image/sech-A.svg)

Polar plot:

~~~spl svg=B
(-2.pi -- 2.pi).polarPlot(sech:/1)
~~~

![](sw/spl/Help/Image/sech-B.svg)

* * *

See also: arcSech, cosh, csch

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/HyperbolicSecant.html)
[2](https://reference.wolfram.com/language/ref/Sech.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.sech.html)
