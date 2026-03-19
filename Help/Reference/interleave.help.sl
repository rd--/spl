# interleave

- _interleave([l₁, l₂, …])_

Answer a `List` that has, alternately, the elements of _l₁, l₂, …_.

```
>>> [3 4 5; 0 1 2].interleave
[3 0 4 1 5 2]
```

Shorter sequences are cycled as required,
meaning that the answer is always twice the size of the longest sequence:

```
>>> [3 4 5; 1 2].interleave
[3 1 4 2 5 1]

>>> [3 4; 0 1 2].interleave
[3 0 4 1 3 2]
```

Alternate positive and negative integers,
OEIS [A001057](https://oeis.org/A001057)
without the leading zero:

```
>>> let n = 1:10;
>>> [n, -n].interleave
[
	1 -1 2 -2 3 -3 4 -4 5 -5
	6 -6 7 -7 8 -8 9 -9 10 -10
]
```

Interleave _n_ and _3n_,
OEIS [A064455](https://oeis.org/A064455):

```
>>> let n = 1:9;
>>> [n, 3 * n].interleave
[1 3 2 6 3 9 4 12 5 15 6 18 7 21 8 24 9 27]
```

Interleave _3(n-1)+1_ and _n_,
OEIS [A123684](https://oeis.org/A123684):

```
>>> let n = 1:9;
>>> [3 * (n - 1) + 1, n].interleave
[1 1 4 2 7 3 10 4 13 5 16 6 19 7 22 8 25 9]

>>> let n = 1:9;
>>> [3 * (n - 1) + 1, n].interleave
>>> .prefixes.collect(average:/1)
[1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9]
```

Interleave _2n-1_ and _3n_,
OEIS [A080512](https://oeis.org/A080512):

```
>>> let n = 1:8;
>>> [2 * n - 1, n * 3].interleave
[1 3 3 6 5 9 7 12 9 15 11 18 13 21 15 24]
```

Generalized heptagonal numbers,
OEIS [A085787](https://oeis.org/A085787):

```
>>> let n = 1:11;
>>> [2 * n - 1, n * 3].interleave.prefixSum
[
	1 4 7 13 18 27 34 46 55 70 81 99 112
	133 148 172 189 216 235 265 286 319
]
```

Interleave _n_ and _1-n_,
OEIS [A097140](https://oeis.org/A097140):

```
>>> let n = 0:9;
>>> [n, 1 - n].interleave
[
	0  1 1  0 2 -1 3 -2 4 -3
	5 -4 6 -5 7 -6 8 -7 9 -8
]
```

Interleave _n+7_ and _13-n_,
OEIS [A122874](https://oeis.org/A122874):

```
>>> let n = 0:9;
>>> [n + 7, 13 - n].interleave
[
	 7 13  8 12  9 11 10 10 11  9
	12  8 13  7 14  6 15  5 16  4
]

>>> [-1 1 1].linearRecurrence([7 13 8], 20)
[
	 7 13  8 12  9 11 10 10 11  9
	12  8 13  7 14  6 15  5 16  4
]
```

Alternating clock-face numbers,
OEIS [A059857](https://oeis.org/A059857):

```
>>> let a = [1 .. 12];
>>> [a.reverse, a].interleave
[
	12  1 11  2 10  3  9  4  8  5
	 7  6  6  7  5  8  4  9  3 10
	 2 11  1 12
]
```

Alternate positive and negative integers,
OEIS [A001057](https://oeis.org/A001057)
without the leading zero:

~~~spl svg=A oeis=A001057
let n = 1:35;
[n, -n].interleave.discretePlot
~~~

![](Help/Image/interleave-A.svg)

Interleave _n_ and _3n_,
OEIS [A064455](https://oeis.org/A064455):

~~~spl svg=B oeis=A064455
let n = 1:35;
[n, 3 * n].interleave.discretePlot
~~~

![](Help/Image/interleave-B.svg)

Interleave _3(n-1)+1_ and _n_,
OEIS [A123684](https://oeis.org/A123684):

~~~spl svg=C oeis=A064455
let n = 1:35;
[3 * (n - 1) + 1, n].interleave.discretePlot
~~~

![](Help/Image/interleave-C.svg)

Interleave _2n-1_ and _3n_,
OEIS [A080512](https://oeis.org/A080512):

~~~spl svg=D oeis=A080512
let n = 1:35;
[2 * n - 1, 3 * n].interleave.discretePlot
~~~

![](Help/Image/interleave-D.svg)

Interleave _n_ and _2n_,
OEIS [A029578](https://oeis.org/A029578):

~~~spl svg=E oeis=A029578
let n = 0:35;
[n, 2 * n].interleave.discretePlot
~~~

![](Help/Image/interleave-E.svg)

Interleave _n+7_ and _13-n_,
OEIS [A122874](https://oeis.org/A122874):

~~~spl svg=F oeis=A122874
let n = 0:32;
[n + 7, 13 - n].interleave.discretePlot
~~~

![](Help/Image/interleave-F.svg)

Alternating clock-face numbers,
OEIS [A059857](https://oeis.org/A059857):

~~~spl svg=G oeis=A059857
let a = [1 .. 12];
[a.reverse, a].interleave.repeat(3)
.discretePlot
~~~

![](Help/Image/interleave-G.svg)

* * *

See also: intercalate, intersperse, transposeIrregular, transpose

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)

Categories: Rearranging
