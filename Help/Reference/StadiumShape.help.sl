# StadiumShape

- _StadiumShape([x₁ y₁; x₂ y₂], r)_

A `Type` representing a stadium shape.
A stadium is all points not more that _r_ from the line _c=(x₁,y₁),(x₂,y₂)_.

The length of the line _c_ is given as _a_.

```
>>> StadiumShape([-1 -1; 1 1], 1)
>>> .a
2 * 2.sqrt
```

The area of a stadium:

```
>>> StadiumShape([-1 0; 1 0], 1)
>>> .area
4 + 1.pi

>>> StadiumShape([-1 -1; 1 1], 1)
>>> .area
(2.sqrt ^ 5) + 1.pi
```

An _x_-axis aligned Stadium with _a=r=2_:

~~~spl svg=A
StadiumShape([-1 0; 1 0], 2)
~~~

![](sw/spl/Help/Image/StadiumShape-A.svg)

A Stadium aligned on the line _y=x_,
with _a=2√2_ and _r=1_:

~~~spl svg=B
StadiumShape([-1 -1; 1 1], 1)
~~~

![](sw/spl/Help/Image/StadiumShape-B.svg)

A _y_-axis aligned Stadium with _a=1_ and _r=4_:

~~~spl svg=C
StadiumShape([0 0; 0 1], 4)
~~~

![](sw/spl/Help/Image/StadiumShape-C.svg)

With varying radii:

~~~spl svg=D
[1 0.75 0.5].collect { :r |
	StadiumShape([-1 -1; 1 1], r)
}.LineDrawing
~~~

![](sw/spl/Help/Image/StadiumShape-D.svg)


With varying coordinates:

~~~spl svg=E
[
	StadiumShape([0 0; 2 2], 1),
	StadiumShape([-2 2; 0 0], 1),
	StadiumShape([0 0; 0 -2], 1)
].LineDrawing
~~~

![](sw/spl/Help/Image/StadiumShape-E.svg)

A family of stadiums:

~~~spl svg=F
1:30.collect { :t |
	let x = 3 * (2.pi * t / 30).cos;
	let y = 3 * (2.pi * t / 30).sin;
	StadiumShape([0 0; x y], 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/StadiumShape-F.svg)

* * *

See also: Arc, Rectangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stadium.html)
[2](https://reference.wolfram.com/language/ref/StadiumShape.html),
_W_
[1](https://en.wikipedia.org/wiki/Stadium_(geometry))
