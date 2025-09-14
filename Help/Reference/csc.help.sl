# csc

- _csc(x)_

Answer the cosecant of the number _x_,
often abbreviated as _csc_.

Equal to the reciprocal of `sin`:

```
>>> 1/2.pi.csc
1 / 1/2.pi.sin
```

At `SmallFloat`:

```
>>> 1.2.csc
1.07292
```

At `Complex`:

```
>>> 2.5J1.csc
0.53096J0.54132
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].csc
[1.0729 1.0025 1.0269]
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.5.pi -- 1.5.pi).functionPlot { :x |
	x.csc.clip([-6 6])
}
~~~

![](sw/spl/Help/Image/csc-A.svg)

Draw csc at integer points:

~~~spl png=B
(
	{ :x :y |
		(x * y).csc.abs.arcTan
	}.table(-50:50, -50:50).abs / 2
).Graymap
~~~

![](sw/spl/Help/Image/csc-B.png)

* * *

See also: cot, sec, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/Cosecant.html)
[2](https://reference.wolfram.com/language/ref/Csc.html),
_W_
[1](https://en.wikipedia.org/wiki/Cosecant)
