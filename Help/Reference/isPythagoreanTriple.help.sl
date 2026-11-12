# isPythagoreanTriple

- _isPythagoreanTriple(a, b, c)_

Answer `true` if _a,b,c_ is a Pythagorean triple,
_c_ may be elided.

```
>>> isPythagoreanTriple(3, 4, 5)
true

>>> isPythagoreanTriple(3, 4)
true

>>> isPythagoreanTriple(5, 12, 13)
true

>>> isPythagoreanTriple(5, 12)
true

>>> isPythagoreanTriple(9, 12, 15)
true

>>> isPythagoreanTriple(9, 12)
true
```

_n_ such that _n-1,n_ is a Pythagorean triple,
OEIS [A046090](https://oeis.org/A046090):

```
>>> [7L -7L 1L].linearRecurrence([1L 4L 21L], 25L)
>>> .allSatisfy { :n |
>>> 	isPythagoreanTriple(n - 1L, n)
>>> }
true
```

Plot _a_ and _b_ of the first few Pythagorean triples:

~~~spl png=A
let i = (-64 .. 64);
{ :b :a |
	isPythagoreanTriple(a, b).boole
}.table(i, i).Bitmap
~~~

![](Help/Image/isPythagoreanTriple-A.png)

Plot _a_ and _c_ of the first few Pythagorean triples:

~~~spl png=B
let i = (-64 .. 64);
{ :c :a |
	let b = (c.square - a.square).sqrt;
	isPythagoreanTriple(a, b, c).boole
}.table(i, i).Bitmap
~~~

![](Help/Image/isPythagoreanTriple-B.png)

* * *

See also: euclidsFormula, isPrimitivePythagoreanTriple

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PythagoreanTriple.html)
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_triple)
