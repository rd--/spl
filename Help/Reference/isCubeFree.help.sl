# isCubeFree

- _isCubeFree(n)_

Answer `true` if the integer _n_ is cube free.

Cube free numbers,
OEIS [A004709](https://oeis.org/A004709):

```
>>> 1:85.select(isCubeFree:/1)
[
	 1  2  3  4  5  6  7  9 10 11
	12 13 14 15 17 18 19 20 21 22
	23 25 26 28 29 30 31 33 34 35
	36 37 38 39 41 42 43 44 45 46
	47 49 50 51 52 53 55 57 58 59
	60 61 62 63 65 66 67 68 69 70
	71 73 74 75 76 77 78 79 82 83
	84 85
]
```

The complement,
OEIS [A046099](https://oeis.org/A046099):

```
>>> 1:85.reject(isCubeFree:/1)
[8 16 24 27 32 40 48 54 56 64 72 80 81]
```

Cube free numbers,
OEIS [A004709](https://oeis.org/A004709):

~~~spl svg=A oeis=A004790
1:100.select(isCubeFree:/1)
.discretePlot
~~~

![](Help/Image/isCubeFree-A.svg)

Cubeful numbers,
OEIS [A046099](https://oeis.org/A046099):

~~~spl svg=B oeis=A046099
1:500.reject(isCubeFree:/1)
.discretePlot
~~~

![](Help/Image/isCubeFree-B.svg)

Characteristic function of cube-free numbers,
OEIS [A212793](https://oeis.org/A212793):

~~~spl svg=C oeis=A212793
1:85.collect(isCubeFree:/1).boole
.discretePlot
~~~

![](Help/Image/isCubeFree-C.svg)

* * *

See also: isSquareFree

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cubefree.html),
_OEIS_
[1](https://oeis.org/A004709)
[2](https://oeis.org/A046099)
