# accumulate

- _accumulate([x₁ x₂ …])_

Answer a `List` of the successive accumulated totals of elements in the sequence _x₁ x₂ …_.
The answer is the same `size` as the sequence,
and has the same first item.
This operation is also called `prefixSum`, and is equivalent to `scan` of `+`.

Triangular numbers:

```
>>> 1:10.accumulate
[1 3 6 10 15 21 28 36 45 55]

>>> 1:10.prefixSum
[1 3 6 10 15 21 28 36 45 55]

>>> 1:10.scan(+)
[1 3 6 10 15 21 28 36 45 55]

>>> 1:10.collect { :n | 1:n.sum }
[1 3 6 10 15 21 28 36 45 55]
```

Diagonals of Pascal’s triangle:

```
>>> accumulate:/1
>>> .nestList([1 .. 5], 5)
>>> .transpose
[
	1  1  1  1   1   1;
	2  3  4  5   6   7;
	3  6 10 15  21  28;
	4 10 20 35  56  84;
	5 15 35 70 126 210
]
```

Find the cumulative sum of the columns of a matix:

```
>>> [1 4 7; 2 5 8; 3 6 9]
>>> .accumulate
[
	1     4     7;
	3     9    15;
	6    15    24
]
```

Plot a random walk:

~~~spl svg=A
Sfc32(89714)
.randomReal([-1 1], [99])
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/accumulate-A.svg)

* * *

See also: +, differences, foldList, prefixSum, scan, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CumulativeSum.html)
[2](https://reference.wolfram.com/language/ref/Accumulate.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.cumsum.html),
_Python_
[1](https://docs.python.org/3/library/itertools.html#itertools.accumulate),
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)

Categories: Enumerating
