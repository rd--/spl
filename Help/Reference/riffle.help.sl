# riffle

- _riffle(p, q)_

Answer a `List` that has, alternately, the elements of the sequences _p_ and _q_.

```
>>> [3 4 5].riffle([-1 -2])
[3 -1 4 -2 5]
```

If _q_ has too few items it is recycled as required:

```
>>> [3 4 5 6].riffle([-1 -2])
[3 -1 4 -2 5 -1 6]
```

Intersperse two lists:

```
>>> ['a' 'b' 'c' 'd'].riffle(['x' 'y' 'z' 'w'])
['a' 'x' 'b' 'y' 'c' 'z' 'd' 'w']
```

It is an `error` if _q_ has too many elements:

```
>>> {
>>> 	[3 4 5].riffle([-1 -2 -3 -4])
>>> }.hasError
true
```

Alternate positive and negative integers:
all but the first term of the canonical enumeration of integers,
OEIS [A001057](https://oeis.org/A001057):

```
>>> 1:10.riffle(-1:-10:-1)
[
	1  -1  2  -2  3  -3  4  -4  5  -5
	6  -6  7  -7  8  -8  9  -9 10 -10
]
```

Interpolate zeroes between each pair of digits of _n_,
OEIS [A051022](https://oeis.org/A051022):

```
>>> 0:19.collect { :n |
>>> 	n.integerDigits
>>> 	.riffle(0)
>>> 	.fromDigits
>>> }
[
	0 1 2 3 4 5 6 7 8 9
	100 101 102 103 104
	105 106 107 108 109
]
```

Plot the nonnegative integers interleaved with zeroes,
OEIS [A142150](https://oeis.org/A142150):

~~~spl svg=A
0:50.riffle(0).discretePlot
~~~

![](sw/spl/Help/Image/riffle-A.svg)

Write _n_ in binary and count zeroes between ones and also the edge,
OEIS [A163510](https://oeis.org/A163510):

~~~spl svg=B
1:37.collect { :n |
	let d = n.integerDigits(2);
	let p = d.riffle(0) ++ [0];
	p.split(=).reject { :x |
		x[1] = 1
	}.collect { :x |
		((x.size - 1) / 2).ceiling
	}.reverse
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/riffle-B.svg)

* * *

See also: inShuffle, intercalate, interleave, intersperse, outShuffle, transpose

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)

Categories: Rearranging
