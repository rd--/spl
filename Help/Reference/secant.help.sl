# secant

- _secant(aNumber)_

Answer the secant of _aNumber_.

Equal to the reciprocal of `cos`:

```
>>> 1/6.pi.secant
1 / 1/6.pi.cos
```

At `SmallFloat`:

```
>>> 1/6.pi.secant
2 / 3.sqrt
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].secant
[2.7597 14.1368 -4.4014]
```

Evaluate for complex arguments:

```
>>> 2.5J1.secant
-0.6111J0.3477
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	secant:/1.clip([-4 4])
)
~~~

![](sw/spl/Help/Image/secant-A.svg)

Plot over a subset of the complex numbers:

~~~spl png=B
let i = (-1.pi -- 1.pi).subdivide(100);
{ :y :x |
	Complex(x, y).secant.abs.clip([0 1])
}.table(i, i).Graymap
~~~

![](sw/spl/Help/Image/secant-B.png)

Plot the sum of the `secant` and `tan` functions:

~~~spl svg=C
(0 -- 4.pi).functionPlot { :x |
	(x.secant + x.tan).clip([-9 9])
}
~~~

![](sw/spl/Help/Image/secant-C.svg)

* * *

See also: cos, cosecant, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Secant.html)
[2](https://reference.wolfram.com/language/ref/Sec.html),
