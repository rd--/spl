# cotangent

- _cotangent(z)_

Answer the cotangent of _z_.

The argument of `cotangent` is assumed to be in radians:

```
>>> 1/3.pi.cotangent
1 / 3.sqrt

>>> 0.cotangent
Infinity

>>> [-2.pi -1.pi 0 1.pi]
>>> .cotangent
>>> .allSatisfy { :x |
>>> 	x.abs > 1E15
>>> }
true
```

Relation to `tan`:

```
>>> let z = 1/7.pi;
>>> 1 / z.tan
z.cotangent
```

Relation to `cos` and `sin`:

```
>>> let z = 1/7.pi;
>>> z.cos / z.sin
z.cotangent
```

Relation to `cosecant`:

```
>>> let z = 1/7.pi;
>>> 1 + z.cotangent.squared
z.cosecant.squared

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	x.cotangent.clip([-6 6])
}
~~~

![](sw/spl/Help/Image/cotangent-A.svg)

* * *

See also: cos, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Cot.html)
