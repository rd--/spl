# isHeronian

- _isHeronian(t)_

Answer `true` if the triangle _t_ is Heronian,
that is if the side lengths and the area are all integers.

```
>>> sssTriangle(13, 14, 15).isHeronian
true

>>> [
>>> 	3 4 5;
>>> 	5 5 6;
>>> 	5 5 8;
>>> 	6 8 10;
>>> 	10 10 12;
>>> 	5 12 13;
>>> 	10 13 13;
>>> 	9 12 15;
>>> 	4 13 15;
>>> 	13 14 15;
>>> 	10 10 16
>>> ].allSatisfy { :each |
>>> 	each.sssTriangle.isHeronian
>>> }
true

>>> [
>>> 	3 4 5;
>>> 	6 8 10;
>>> 	5 12 13;
>>> 	9 12 15;
>>> 	4 13 15;
>>> 	13 14 15;
>>> 	9 10 17
>>> ].allSatisfy { :each |
>>> 	each.sssTriangle.isHeronian
>>> }
true

>>> [
>>> 	135 352 377;
>>> 	132 366 366
>>> ].allSatisfy { :each |
>>> 	each.sssTriangle.isHeronian
>>> }
true
```

Equable Heronian triangles:

```
>>> [
>>> 	5 12 13;
>>> 	6 8 10;
>>> 	6 25 29;
>>> 	7 15 20;
>>> 	9 10 17
>>> ].allSatisfy { :each |
>>> 	let t = each.sssTriangle;
>>> 	t.isHeronian & {
>>> 		t.perimeter ~ t.area
>>> 	}
>>> }
true
```

* * *

See also: area, isDescartesQuadruple, isInteger, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HeronianTriangle.html),
_OEIS_
[1](http://oeis.org/A055594)
[2](http://oeis.org/A055593)
[3](http://oeis.org/A055592)
[4](http://oeis.org/A046128)
[5](http://oeis.org/A046129)
[6](http://oeis.org/A046130)
[7](http://oeis.org/A046131),
_W_
[1](https://en.wikipedia.org/wiki/Heronian_triangle)
