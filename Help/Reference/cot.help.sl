# cot

- _cot(z)_

Answer the cotangent of the number _z_,
often abbreviated as _cot_.

The argument of `cot` is assumed to be in radians:

```
>>> 1/3.pi.cot
1 / 3.sqrt

>>> 0.cot
Infinity

>>> [-2.pi -1.pi 0 1.pi]
>>> .cot
>>> .allSatisfy { :x |
>>> 	x.abs > 1E15
>>> }
true
```

Least real fixed point:

```
>>> 0.8603335890.cot
0.8603335890
```

Relation to `tan`:

```
>>> let z = 1/7.pi;
>>> 1 / z.tan
z.cot
```

Relation to `cos` and `sin`:

```
>>> let z = 1/7.pi;
>>> z.cos / z.sin
z.cot
```

Relation to `csc`:

```
>>> let z = 1/7.pi;
>>> 1 + z.cot.squared
z.csc.squared
```

The continued fraction is highly regular:

```
>>> 1.cot.continuedFraction(17)
[0 1 1 1 3 1 5 1 7 1 9 1 11 1 13 1 15]
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	x.cot.clip([-6 6])
}
~~~

![](sw/spl/Help/Image/cot-A.svg)

Plot at integer points:

~~~spl png=B
{ :x :y |
	(x * y).cot.abs.arcCot
}.table(-40:40, -40:40)
.rescale.Graymap
~~~

![](sw/spl/Help/Image/cot-B.png)

* * *

See also: cos, coth, csc, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cotangent.html)
[2](https://reference.wolfram.com/language/ref/Cot.html),
_OEIS_
[1](https://oeis.org/A069855)
