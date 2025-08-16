# arcCot

- _arcCot(z)_

Answer the arc cotangent of _z_ in radians:

```
>>> 1.arcCot
1/4.pi

>>> 2.5.arcCot
0.380506
```

Relation to `arcTan`:

```
>>> let z = 2.5;
>>> z.arcCot
(1 / z).arcTan
```

Divide by `degree` to get results in degrees:

```
>>> 0.arcCot / 1.degree
90
```

At negative values:

```
>>> -2.arcCot
-0.463648

>>> -2.arcCot + 1.pi
2.677945
```

At infinity:

```
>>> Infinity.arcCot
0
```

At `Complex`:

```
>>> 1.5J0.3.arcCot
0.57536J-0.09081
```

Find angles of the right triangle with sides 3, 4 and hypotenuse 5:

```
>>> [4 / 3, 3 / 4].arcCot / 1.degree
[36.8699 53.1301]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(arcCot:/1)
~~~

![](sw/spl/Help/Image/arcCot-A.svg)

* * *

See also: arcTan, arcCoth, cot, degree

References:
_Mathematica_
[1](http://mathworld.wolfram.com/InverseCotangent.html)
[2](https://reference.wolfram.com/language/ref/ArcCot.html)
