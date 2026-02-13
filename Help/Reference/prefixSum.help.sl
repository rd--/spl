# prefixSum

- _prefixSum([x₁ x₂ …])_

Answer a `List` of the successive accumulated totals of elements in the sequence _x_.
This operation is also called `accumulate`, and is equivalent to _scan(x,+)_.

Triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

```
>>> 0:10.prefixSum
[0 1 3 6 10 15 21 28 36 45 55]

>>> [0 1 2 3 4 5 6].prefixSum
[0 1 3 6 10 15 21]
```

It is also equivalent to `sum` of each of the `prefixes`:

```
>>> 0:10.prefixes.collect(sum:/1)
[0 1 3 6 10 15 21 28 36 45 55]
```

At matrices:

```
>>> [1 2 3; 4 5 6].prefixSum
[1 2 3; 5 7 9]
```

Oblong numbers,
also called promic or pronic or heteromecic numbers,
OEIS [A002378](https://oeis.org/A002378):

```
>>> 0:10.prefixSum * 2
[0 2 6 12 20 30 42 56 72 90 110]

>>> 0:20:2.prefixSum
[0 2 6 12 20 30 42 56 72 90 110]
```

Triangular matchstick numbers,
OEIS [A045943](https://oeis.org/A045943):

```
>>> 0:10.prefixSum * 3
[0 3 9 18 30 45 63 84 108 135 165]

>>> 0:30:3.prefixSum
[0 3 9 18 30 45 63 84 108 135 165]
```

OEIS [A046092](https://oeis.org/A046092):

```
>>> 0:10.prefixSum * 4
[0 4 12 24 40 60 84 112 144 180 220]
```

The triangular numbers modulo twelve,
the period is twenty-four,
the visited set is _0,1,3,4,6,7,9,10_:

```
>>> (0:100.prefixSum % 12).findRepeat
[
	0  1  3  6 10  3  9  4  0  9
	7  6  6  7  9  0  4  9  3 10
	6  3  1  0
]

>>> (0:23.prefixSum % 12).counts
[
	0 -> 4, 1 -> 2, 3 -> 4, 4 -> 2,
	6 -> 4, 7 -> 2, 9 -> 4, 10 -> 2
]
```

Find the period of repeats for the triangular numbers modulo _n_,
[A022998](https://oeis.org/A022998):

```
>>> let t = 0:100.prefixSum;
>>> 1:23.collect { :n |
>>> 	(t % n).findRepeat.size
>>> }
[
	 1  4  3  8  5 12  7 16  9 20
	11 24 13 28 15 32 17 36 19 40
	21 44 23
]
```

Plot triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

~~~spl svg=A
1:12.prefixSum.discretePlot
~~~

![](sw/spl/Help/Image/prefixSum-A.svg)

Find and plot the repeats for the triangular numbers modulo _n_,
for the first few values of _n_:

~~~spl svg=B
let t = 0:100.prefixSum;
1:18.collect { :n |
	(t % n).findRepeat
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-B.svg)

Plot three later terms,
_n=63:65_,
constrcuted using an iterative algorithm:

~~~spl svg=C
63:65.collect { :m |
	let c = 1;
	{ :i |
		let j = (i + c).mod(m, 1);
		c := c + 1;
		j
	}.nestList(1, m * 2).findRepeat
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/prefixSum-C.svg)

* * *

See also: +, accumulate, differences, prefixes, prefixProduct, scan, sum

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CumulativeSum.html),
_Python_
[1](https://numpy.org/doc/2.1/reference/generated/numpy.cumsum.html),
_R_
[1](https://stat.ethz.ch/R-manual/R-devel/library/base/html/cumsum.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-integrate),
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)
