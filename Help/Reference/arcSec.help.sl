# arcSec

- _arcSec(z)_

Answers the arc secant of the complex number _z_ in radians.

`SmallFloat` arguments:

```
>>> 2.arcSec
1/3.pi

>>> 5.arcSec
1.36944

>>> (2 / 3.sqrt).arcSec
1/6.pi
```

At `one`:

```
>>> 1.arcSec
0

>>> -1.arcSec
1.pi
```

`arcSec` is not defined for the interval _(-1,1)_:

```
>>> [-0.5 0 0.5].arcSec.isFinite
false
```

`Complex` arguments:

```
>>> 0.5J2.3.arcSec
1.487388J0.405414
```

At infinity:

```
>>> Infinity.arcSec
1/2.pi
```

Threads elementwise over lists:

```
>>> [-2 -1 0 1 2].arcSec
[2/3.pi 1.pi Infinity 0 1/3.pi]
```

Inverse is `sec`:

```
>>> let x = 1/3.pi;
>>> (x.arcSec.sec, x.sec.arcSec)
(x, x)
```

Relation to `arcCos`:

```
>>> 2.arcSec
(1 / 2).arcCos
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(arcSec:/1)
~~~

![](sw/spl/Help/Image/arcSec-A.svg)

* * *

See also: arcSech, cos, sec, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseSecant.html)
[2](https://reference.wolfram.com/language/ref/ArcSec.html),

Categories: Math, Trigonometry
