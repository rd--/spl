# arcCoth

- _arcCoth(z)_

Answers the inverse hyperbolic secant of the complex number _z_.

`SmallFloat` arguments:

```
>>> 2.5.arcCoth
0.423649

>>> 2.arcCoth
0.549306
```

Not defined for real _z_ in _(-1,1)_:

```
>>> [-0.99 .. 0.99; 0.01]
>>> .arcCoth
>>> .allTrue(isNaN/1)
true
```

At `one` and infinity:

```
>>> 1.arcCoth
Infinity

>>> Infinity.arcCoth
0

>>> -1.arcCoth
-Infinity
```

`Complex` arguments:

```
>>> 2.5J1.arcCoth
0.351336J-0.154851

>>> [-1J0 0J0 1J0]
>>> .arcCoth
>>> .allTrue(isNaN/1)
true
```

Threads elementwise over lists:

```
>>> [-2 1 2].arcCoth
[-0.5493 Infinity 0.5493]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :x |
	(x.abs > 1).if {
		x.arcCoth.clip(-1.5, 1.5)
	} {
		0
	}
}
~~~

![](Help/Image/arcCoth-A.svg)

Plot of complex `arcCoth` function:

~~~spl png=B
[-5J-5 5J5].complexPlot { :x |
	(x ~ 0).if {
		NaN
	} {
		x.arcCoth
	}
}
~~~

![](Help/Image/arcCoth-B.png)

* * *

See also: arcSec, cos, sec, tan

Guides: Hyperbolic Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicCotangent.html)
[2](https://reference.wolfram.com/language/ref/ArcCoth.html),
