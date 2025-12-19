# quilezGradient

- _quilezGradient([a, b, c, d])_

A colour gradient function by Iñigo Quilez.
Given a 4×3 matrix,
answers a one argument `Block` that accepts a number in _(0,1)_,
and answers an _(r,g,b)_ triple, also in _(0,1)_.

As μ runs from 0 to 1,
the cosine oscilates _c_ times with a phase of _d_.
The result is scaled and biased by _a_ and _b_ to meet the desired contrast and brightness.

Evaluate symbolically:

```
>> [`a` `b` `c` `d`].quilezGradient
>> .value(`x`)
(+ a (* b (cos (* (* 2 π) (+ (* c x) d)))))
```

_a_ and _b_ of _1/2_ scales the _(-1,1)_ answer of `cos` to _(0,1)_.
_c_ of _1_ leaves _mu_ unscaled.
Draw a gradient that places the red, green and blue components at equal phase distances:

~~~spl svg=A
(0 -- 1).discretize(48).collect(
	[
		0.50 0.50 0.50;
		0.50 0.50 0.50;
		1.00 1.00 1.00;
		0.00 0.33 0.67
	].quilezGradient
).asContinuousColourGradient
~~~

![](sw/spl/Help/Image/quilezGradient-A.svg)

Draw a gradient that cycles red twice, green once and blue not at all:

~~~spl svg=B
(0 -- 1).discretize(48).collect(
	[
		0.50 0.50 0.50;
		0.50 0.50 0.50;
		2.00 1.00 0.00;
		0.50 0.20 0.25
	].quilezGradient
).asContinuousColourGradient
~~~

![](sw/spl/Help/Image/quilezGradient-B.svg)

Draw a gradient where green and blue are in phase,
and red is scaled low and biased high:

~~~spl svg=C
(0 -- 1).discretize(48).collect(
	[
		0.80 0.50 0.40;
		0.20 0.40 0.20;
		2.00 1.00 1.00;
		0.00 0.25 0.25
	].quilezGradient
).asContinuousColourGradient
~~~

![](sw/spl/Help/Image/quilezGradient-C.svg)

An orange, magenta, blue gradient where the coefficients answer values outside of _(0, 1)_,
and are therefore clipped:

~~~spl svg=D
(0 -- 1).discretize(48).collect(
	[
		0.821 0.328 0.242;
		0.659 0.481 0.896;
		0.612 0.340 0.296;
		2.820 3.026 -0.273
	].quilezGradient
)
.clip([0 1])
.asContinuousColourGradient
~~~

![](sw/spl/Help/Image/quilezGradient-D.svg)

A yellow, magenta, cyan gradient:

~~~spl svg=E
(0 -- 1).discretize(48).collect(
	[
		1.00 0.50 0.50;
		0.50 0.50 0.50;
		0.75 1.00 0.66;
		0.80 1.00 0.33
	].quilezGradient
)
.clip([0 1])
.asContinuousColourGradient
~~~

![](sw/spl/Help/Image/quilezGradient-E.svg)

* * *

See also: asContinuousColourGradient, Colour, ColourGradient, cubeHelix, RgbColour, turboGradient

Guides: Colour Functions

References:
_Quilez_
[1](https://iquilezles.org/articles/palettes/)
