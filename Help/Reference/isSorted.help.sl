# isSorted

- _isSorted([x₁ x₂ …])_

Answers `true` if the sequence _x_ is sorted by `<=`, else `false`.

At `List`:

```
>>> [1, 3 .. 11].isSorted
true

>>> [1 3 2 5 4].isSorted
false

>>> [5 12 33 39 78 90 95 107].isSorted
true
```

At `Range`:

```
>>> (1 .. 9).isSorted
true

>>> (9, 8 .. 1).isSorted
false

>>> 1:9.isSorted
true

>>> 9:1:-1.isSorted
false
```

At `RelativeRange`:

```
>>> 1:-1.isSorted
true

>>> -1:1:-1.isSorted
false
```

Check if a list of numbers is ordered:

```
>>> [1 4 2].isSorted
false

>>> [1 2.sqrt 2 1.e 3 1.pi].isSorted
true
```

Check if a list of strings is ordered:

```
>>> ['cat' 'catfish' 'fish'].isSorted
true
```

Find tuples that are in order:

```
>>> [1 2 3].tuples(4).select(isSorted:/1)
[
	1 1 1 1; 1 1 1 2; 1 1 1 3; 1 1 2 2;
	1 1 2 3; 1 1 3 3; 1 2 2 2; 1 2 2 3;
	1 2 3 3; 1 3 3 3; 2 2 2 2; 2 2 2 3;
	2 2 3 3; 2 3 3 3; 3 3 3 3
]
```

Plot indices of sorted tuples:

~~~spl svg=A
[0 1 -1]
.tuples(6)
.collect(isSorted:/1)
.indicesOf(true)
.scatterPlot
~~~

![](sw/spl/Help/Image/isSorted-A.svg)

Plot numbers where in the binary expansion run lengths do not decrease,
OEIS [A037016](https://oeis.org/A037016):

~~~spl svg=B
0:250.select { :n |
	n.integerDigits(2)
	.split(=)
	.collect(size:/1)
	.reverse
	.isSorted
}.scatterPlot
~~~

![](sw/spl/Help/Image/isSorted-B.svg)

* * *

See also: isSortedBetweenAnd, isSortedBy, sort, sorted

Guides: Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/OrderedQ.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/issorted.html),
_W_
[1](https://en.wikipedia.org/wiki/Monotonic_function)

Categories: Testing, Sorting
