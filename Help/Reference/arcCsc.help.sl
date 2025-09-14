# arcCsc

- _arcCsc(z)_

Answers the arc cosecant of the complex number _z_ in radians.

`SmallFloat` arguments:

```
>>> 1.arcCsc
1/2.pi

>>> 5.arcCsc
0.201358

>>> (2 / 3.sqrt).arcCsc
1/3.pi
```

At `one`:

```
>>> 1.arcCsc
1/2.pi

>>> -1.arcCsc
-1/2.pi
```

`arcCsc` is not defined for the interval _(-1,1)_:

```
>>> [-0.5 0 0.5].arcCsc.isFinite
false
```

`Complex` arguments:

```
>>> 0.5J2.3.arcCsc
0.083409J-0.405414
```

At infinity:

```
>>> Infinity.arcCsc
0
```

Threads elementwise over lists:

```
>>> [2.sqrt.-, 0, 2.sqrt].arcCsc
[-1/4.pi Infinity 1/4.pi]
```

Inverse is `csc`:

```
>>> let x = 1/3.pi;
>>> (x.arcCsc.csc, x.csc.arcCsc)
(x, x)
```

Relation to `arcSin`:

```
>>> 2.arcCsc
(1 / 2).arcSin
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(arcCsc:/1)
~~~

![](sw/spl/Help/Image/arcCsc-A.svg)

* * *

See also: arcCsch, cos, sec, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseCosecant.html)
[2](https://reference.wolfram.com/language/ref/ArcCsc.html),

Categories: Math, Trigonometry
