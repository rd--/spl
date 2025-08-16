# coth

- _coth(z)_

Answer the hyperbolic cotangent of _z_.

Evaluate numerically:

```
>>> 1.2.coth
1.19954
```

Relation to `cosh` and `sinh`:

```
>>> let z = 1.2;
>>> z.cosh / z.sinh
z.coth
```

At `Complex`:

```
>>> 2.5J1.coth
0.994333J-0.012185
```

At `List`:

```
>>> [0 1 2 3].pi.coth
[Infinity 1.00374 1 1]
```

Unique real fixed point:

```
>>> 1.1996786.coth
1.1996786
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot { :x |
	x.coth.clip([-4 4])
}
~~~

![](sw/spl/Help/Image/coth-A.svg)

* * *

See also: cosh, cot, sinh

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicCotangent.html)
[2](https://reference.wolfram.com/language/ref/Coth.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.coth.html),
_OEIS_
[1](https://oeis.org/A085984)

Categories: Trigonometry, Math
