# arnoldsCatMap

- _arnoldsCatMap(m, k=1)_

Discrete analogue of the Arnold’s cat map,
a chaotic map from the torus into itself.
Apply _k_ iterations of the map to the the matrix _m_.

Iteration pattern for a 5×5 matrix:

```
>>> let m = [5 5].iota;
>>> let [a, b, c] = [
>>> 	 5 21 17 13  9;
>>> 	14 10  1 22 18;
>>> 	23 19 15  6  2;
>>> 	 7  3 24 20 11;
>>> 	16 12  8 4  25
>>> 	:;
>>> 	19 18 17 16 20;
>>> 	14 13 12 11 15;
>>> 	 9  8  7  6 10;
>>> 	 4  3  2  1  5;
>>> 	24 23 22 21 25
>>> 	:;
>>> 	22  7 17  2 12;
>>> 	14 24  9 19  4;
>>> 	 1 11 21  6 16;
>>> 	18  3 13 23  8;
>>> 	10 20  5 15 25
>>> ];
>>> 0:9.collect { :i |
>>> 	m.arnoldsCatMap(i)
>>> } = [m a m b m c m b m a]
true
```

A smooth diagonal rainbow,
transformed into vertical lines by _k=4_:

~~~spl svg=A
let n = 13;
{ :y :x |
	HsvColour[
		((x + y) % n) / n,
		0.6,
		0.92
	]
}.table(1:n, 1:n)
.arnoldsCatMap(4)
.ColourGrid
~~~

![](Help/Image/arnoldsCatMap-A.svg)

* * *

See also: mod, recurrenceMatrix

Guides: Chaotic Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArnoldsCatMap.html),
_W_
[1](https://en.wikipedia.org/wiki/Arnold%27s_cat_map)
