# isPythagoreanTriple

- _isPythagoreanTriple(a, b, c)_

Answer `true` if _a,b,c_ is a Pythagorean triple,
_c_ may be elided.

Plot _a_ and _b_ of the first few Pythagorean triples:

~~~spl png=A
let i = (-64 .. 64);
{ :b :a |
	isPythagoreanTriple(a, b).boole
}.table(i, i).Bitmap
~~~

![](sw/spl/Help/Image/isPythagoreanTriple-A.png)

Plot _a_ and _c_ of the first few Pythagorean triples:

~~~spl png=B
let i = (-64 .. 64);
{ :c :a |
	let b = (c.square - a.square).sqrt;
	isPythagoreanTriple(a, b, c).boole
}.table(i, i).Bitmap
~~~

![](sw/spl/Help/Image/isPythagoreanTriple-B.png)

* * *

See also: euclidsFormula, isPrimitivePythagoreanTriple

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PythagoreanTriple.html)
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_triple)
