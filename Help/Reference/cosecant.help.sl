# cosecant

- _cosecant(aNumber)_

Answer the cosecant of _aNumber_.

Equal to the reciprocal of `sin`:

```
>>> 1/2.pi.cosecant
1 / 1/2.pi.sin
```

At `SmallFloat`:

```
>>> 1.2.cosecant
1.07292
```

At `Complex`:

```
>>> 2.5J1.cosecant
0.53096J0.54132
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cosecant
[1.0729 1.0025 1.0269]
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.5.pi -- 1.5.pi).functionPlot { :x |
	x.cosecant.clip(-6, 6)
}
~~~

![](sw/spl/Help/Image/cosecant-A.svg)

Draw cosecant at integer points:

~~~spl png=B
(
	{ :x :y |
		(x * y).cosecant.abs.arcTan
	}.table(-50:50, -50:50).abs / 2
).Graymap
~~~

![](sw/spl/Help/Image/cosecant-B.png)

* * *

See also: cotangent, secant, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Csc.html)
