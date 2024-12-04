# cotangent

- _cotangent(z)_

Answer the cotangent of _z_.

The argument of _cotangent_ is assumed to be in radians:

```
>>> (pi / 3).cotangent
(1 / 3.sqrt)
```

Relation to `tan`:

```
>>> let z = pi / 2;
>>> 1 / z.tan
z.cotangent
```

Relation to `cos` and `sin`:

```
>>> let z = pi / 2;
>>> z.cos / z.sin
z.cotangent
```

Plot over a subset of the reals:

~~~
(-3 -- 3).functionPlot { :x |
	x.cotangent.clip(-6, 6)
}
~~~

![](sw/spl/Help/Image/cotangent-A.svg)

* * *

See also: cos, sin, tan

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Cot.html)
