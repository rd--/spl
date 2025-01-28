# arcCosh

- _arcCosh(aNumber)_

Answer the inverse hyperbolic cosine of the _aNumber_.

```
>>> 1.5.arcCosh
0.96242
```

Inverse is cosh:

```
>>> 2.arcCosh.cosh
2
```

Threads over lists:

```
>>> [1 2 3 1.pi].arcCosh
[0 1.31696 1.76275 1.81153]
```

Plot over a subset of the reals:

~~~spl svg=A
(1 -- 10).functionPlot(arcCosh:/1)
~~~

![](sw/spl/Help/Image/arcCosh-A.svg)

* * *

See also: arcCos, cos

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tangent.html)
[2](https://reference.wolfram.com/language/ref/ArcCosh.html)

Categories: Math, Trigonometry
