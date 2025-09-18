# isPrimitivePythagoreanTriple

- _isPrimitivePythagoreanTriple([a b c])_

Answer `true` if _a,b,c_ is a primitive Pythagorean triple,
_c_ may be elided.

The first few primitive Pythagorean triples,
sorted by _c_:

```
>>> let i = [1 .. 100];
>>> let t = [];
>>> 1.toDo(100) { :a |
>>> 	(a + 1).toDo(100) { :b |
>>> 		isPrimitivePythagoreanTriple(a, b)
>>> 		.ifTrue {
>>> 			let c = ((a ^ 2) + (b ^ 2)).sqrt;
>>> 			t.add([a, b, c])
>>> 		}
>>> 	}
>>> };
>>> t.sortByOn(<=, last:/1)
[
	 3  4  5;
	 5 12 13;
	 8 15 17;
	 7 24 25;
	20 21 29;
	12 35 37;
	 9 40 41;
	28 45 53;
	11 60 61;
	33 56 65;
	16 63 65;
	48 55 73;
	36 77 85;
	13 84 85;
	39 80 89;
	65 72 97;
	20 99 101;
	60 91 109
]
```

Plot _a_ and _b_ of the first few primitive Pythagorean triples:

~~~spl png=A
let i = (-64 .. 64);
{ :b :a |
	isPrimitivePythagoreanTriple(a, b).boole
}.table(i, i).Bitmap
~~~

![](sw/spl/Help/Image/isPrimitivePythagoreanTriple-A.png)

* * *

See also: euclidsFormula, isPythagoreanTriple

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PythagoreanTriple.html)
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_triple)
