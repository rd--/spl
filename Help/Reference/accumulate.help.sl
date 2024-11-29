# accumulate

- _accumulate(aSequence)_

Answer a List of the successive accumulated totals of elements in _aSequence_.
This operation is also called `prefixSum`, and is equivalent to _scan(aSequence, +)_.

Triangular numbers:

```
>>> 1:10.accumulate
[1 3 6 10 15 21 28 36 45 55]

>>> 1:10.prefixSum
[1 3 6 10 15 21 28 36 45 55]

>>> 1:10.scan(+)
[1 3 6 10 15 21 28 36 45 55]
```

Diagonals of Pascal’s triangle:

```
>>> accumulate:/1.nestList(1:5, 5).transposed
[
	1  1  1  1   1   1;
	2  3  4  5   6   7;
	3  6 10 15  21  28;
	4 10 20 35  56  84;
	5 15 35 70 126 210
]
```

Plot a random walk:

~~~
Sfc32(89714).randomReal(-1, 1, [99]).accumulate.linePlot
~~~

* * *

See also: +, foldList, scan, prefixSum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CumulativeSum.html)
[2](https://reference.wolfram.com/language/ref/Accumulate.html)
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)

Categories: Enumerating
