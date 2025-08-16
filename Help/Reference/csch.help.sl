# csch

- _csch(x)_

Answer the hyperbolic cosecant of the number _x_.

```
>>> 1.8.csch
0.339885

>>> 1/3.pi.i.csch
-2.i / 3.sqrt
```

Relation to `sinh`:

```
>>> 1 / 1.8.sinh
0.339885
```

At `zero` and `Infinity`:

```
>>> 0.csch
Infinity

>>> Infinity.csch
0
```

At `Complex`:

```
>>> 1 / 2.5J1.sinh
0.08761J-0.13829
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :x |
	x.csch.clip([-1.5 1.5])
}
~~~

![](sw/spl/Help/Image/csch-A.svg)

* * *

See also: arcCsch, sech, sinh

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/HyperbolicCosecant.html)
[2](https://reference.wolfram.com/language/ref/Csch.html)
