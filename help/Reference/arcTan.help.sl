# arcTan

- _arcTan(z)_
- _arcTan(x, y)_

Answer the arc tangent of the complex number _z_,
or of _x/y_ taking into account which quadrant the point _(x, y)_ is in.
Answers are given in radians.
For real _z_, the results are always in the range _-pi/2_ to _pi/2_.
_arcTan_ is the inverse tangent function.

```
>>> 1.arcTan
0.25.pi

>>> 0.25.pi.tan
1

>>> 0.5.arcTan
0.46365

>>> arcTan(0.5, 2)
1.32582

>>> arcTan(-2, 1)
2.67795
```

Answers are in radians:

```
>>> 1.arcTan.radians.degrees
45

>>> 1.arcTan.radiansToDegrees
45
```

_arcTan(x, y)_ gives the angle of the point _(x, y)_:

```
>>> arcTan(1, 1)
0.25.pi

>>> arcTan(-1, -1)
-0.75.pi
```

Evaluate for `Complex` arguments:

```
>>> 2.5j1.arcTan
1.23343j0.12367
```

The two-argument form supports `Complex` numbers:

```
>>> arcTan(2.5j1, 2j0)
0.62828j-0.18589
```

Threads elementwise over lists and matrices:

```
>>> [0.1 0.2 0.3].arcTan
[0.09967 0.19740 0.29146]
```

At infinity:

```
>>> inf.arcTan
0.5.pi

>>> arcTan(inf, 1)
0

>>> arcTan(-1, inf)
0.5.pi
```

Zero of `arcTan`:

```
>>> 0.arcTan
0
```

`arcTan` of two arguments gives the signed vector angle between the _x_-axis and the vector:

```
>>> let [x, y] = [1, 2];
>>> x.arcTan(y)
2.arcTan

>>> [1 0].vectorAngle([1 2])
(1 / 5.sqrt).arcCos

>>> 2.arcTan = (1 / 5.sqrt).arcCos
true
~~~

Plot over a subset of the reals:

~~~
(-5, -4.99 .. 5).arcTan.plot
~~~

Note:
The two argument form reverses the argument order to _arcTan:_ in Smalltalk.
The method _atan2_ is the two argument _arcTan_ with arguments reversed.

```
>>> arcTan(0.5, 2)
atan2(2, 0.5)
```

* * *

See also: arcCos, arcSin, cos, sin, tan

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=invtrig),
_Mathematica_
[1](https://mathworld.wolfram.com/ArcTan.html)
[2](https://reference.wolfram.com/language/ref/ArcTan.html),
_Smalltalk_
5.6.7.4

Categories: Math, Trigonometry
