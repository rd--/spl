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

Plot the nonnegative integers interleaved with zeroes,
OEIS [A142150](https://oeis.org/A142150):

~~~spl svg=A
0:50.riffle(0).discretePlot
~~~

![](sw/spl/Help/Image/riffle-A.svg)

* * *

See also: inShuffle, intercalate, interleave, intersperse, outShuffle, transpose

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)

Categories: Rearranging
