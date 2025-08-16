# arcSech

- _arcSech(z)_

Answers the inverse hyperbolic secant of the complex number _z_.

`SmallFloat` arguments:

```
>>> 0.5.arcSech
1.31696

>>> (1 / 3).arcSech
1.76275
```

`Complex` arguments:

```
>>> 1.5J-1.arcSech
0.33569J1.11887
```

Threads elementwise over lists:

```
>>> [0 0.5 1].arcSech
[Infinity 1.31696 0]
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 1).functionPlot(arcSech:/1)
~~~

![](sw/spl/Help/Image/arcSech-A.svg)

* * *

See also: arcSec, cos, sec, tan

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicSecant.html)
[2](https://reference.wolfram.com/language/ref/ArcSech.html),

Categories: Math, Trigonometry
