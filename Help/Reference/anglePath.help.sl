# anglePath

- _anglePath([θ₁ θ₂ …], [r₁ r₂ …], o)_

Answer the `List` of two-dimensional coordinates corresponding to a path that starts at origin _o_,
then takes a series of steps of length _r_ at successive relative angles _θ_.
If _r_ and _o_ are elided _r_ is uniformly one, and _o_ is _(0,0)_.

```
>>> (90.degree # 3).anglePath
[0 0; 0 1; -1 1; -1 0]
```

A polyline of three segments:

~~~spl svg=A
let t = [90 130 -85].degree;
let r = [1.2 2.1 0.7];
let p = t.anglePath(r, [0 0]);
p.Line
~~~

![](sw/spl/Help/Image/anglePath-A.svg)

Advance 20 steps, always turning 110° toward the left:

~~~spl svg=B
(110.degree # 20).anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-B.svg)

With unit step sizes:

~~~spl svg=C
(1.pi / [2 3 -4]).anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-C.svg)

With specified step sizes:

~~~ spl svg=D
(1.pi / [2 3 -4]).anglePath(
	[0.7 2.3 3.5],
	[0 0]
).Line
~~~

![](sw/spl/Help/Image/anglePath-D.svg)

Make a random walk where successive steps change direction by at most 20°:

~~~spl svg=E
Sfc32(57951)
.randomReal([-20 20], [1000])
.degree
.anglePath
.Line
~~~

![](sw/spl/Help/Image/anglePath-E.svg)

Generate a dragon curve:

~~~spl svg=F
let c = { :l |
	l ++ [0] ++ (1 - l).reverse
}.iterate([0], 9);
let theta = [90 -90].degree @* (c + 1);
theta.anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-F.svg)

Generate a Koch snowflake curve:

~~~spl svg=G
let t = 256.thueMorseSequence;
(t * 2.pi / 3).anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-G.svg)

Another pattern based on the Thue-Morse sequence:

~~~spl svg=H
let t = 256.thueMorseSequence;
(t * 2.pi / 5).anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-H.svg)

Draw a line for which consecutive relative angles increase and are modulated by a `sin` function:

~~~spl svg=I
(0, 0.01 .. 50).collect { :t |
	t * t.sin
}.anglePath.Line
~~~

![](sw/spl/Help/Image/anglePath-I.svg)

* * *

See also: absArg, accumulate, angleVector, cos, degree, foldList, sin, substitutionSystem

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnglePath.html)

Categories: Geometry
