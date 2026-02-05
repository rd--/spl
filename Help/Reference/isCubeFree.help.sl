# isCubeFree

- _isCubeFree(n)_

Answer `true` if the integer _n_ is cube free.

The first few terms,
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

Plot the first few cubefree numbers:

~~~spl svg=A
1:99.select(isCubeFree:/1).stepPlot
~~~

![](sw/spl/Help/Image/isCubeFree-A.svg)

Plot the first few cubeful numbers:

~~~spl svg=B
1:99.reject(isCubeFree:/1).stepPlot
~~~

![](sw/spl/Help/Image/isCubeFree-B.svg)

* * *

See also: isSquareFree

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cubefree.html),
_OEIS_
[1](https://oeis.org/A004709)
[2](https://oeis.org/A046099)
