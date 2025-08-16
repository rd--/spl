# arcTanh

- _arcTanh(z)_

Answer the inverse hyperbolic tangent of the number _z_.

```
>>> 0.5.arcTanh
0.549306
```

At `zero`:

```
>>> 0.arcTanh
0
```

At `one`:

```
>>> 1.arcTanh
Infinity
```

At `Complex`:

```
>>> 2.5J1.arcTanh
0.351336J1.415945
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :z |
	z.arcTanh.clip([-3 3])
}
~~~

![](sw/spl/Help/Image/arcTanh-A.svg)

* * *

See also: arcCoth, arcTan, tanh

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/InverseHyperbolicTangent.html)
[2](https://reference.wolfram.com/language/ref/ArcTanh.html)
