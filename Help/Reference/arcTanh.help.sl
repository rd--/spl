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

>>> 0J0.arcTanh
0J0

>> 1J0.arcTanh
NaN
```

Threads over lists:

```
>>> [-1 0 1].arcTanh
[-Infinity 0 Infinity]

>>> [-Infinity Infinity].arcTanh
>>> .collect(isNaN/1)
[true true]
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :z |
	z.arcTanh.clip(-3, 3)
}
~~~

![](Help/Image/arcTanh-A.svg)

Plot of complex `arcTanh` function:

~~~spl png=B
[-2J-2 2J2].complexPlot(
	arcTanh/1
)
~~~

![](Help/Image/arcTanh-B.png)

* * *

See also: arcCoth, arcTan, tanh

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/InverseHyperbolicTangent.html)
[2](https://reference.wolfram.com/language/ref/ArcTanh.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_hyperbolic_tangent)
