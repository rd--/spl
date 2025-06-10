# differences

- _differences([x₁ x₂ …], n=1)_

Answer the successive differences of elements in a sequence.
The size of the answer is _n_ places less that the size of the sequence.

First differences of a `Range`:

```
>>> 1:5.differences
[1 1 1 1]

>>> [1 1 1 1].foldList(1, +)
[1 2 3 4 5]
```

At `List`:

```
>>> [3 4 1 1].differences
[1 -3 0]

>>> [1 -3 0].foldList(3, +)
[3 4 1 1]

>>> [1 1 2 3 5 8 13 21].differences
[0 1 1 2 3 5 8]

>>> [0 1 1 2 3 5 8].foldList(1, +)
[1 1 2 3 5 8 13 21]

>>> [1 2 4 7 0].differences
[1 2 3 -7]
```

Second differences:

```
>>> [1 3 6 10 16 18 29].differences(2)
[1 1 2 -4 9]

>>> [1 1 2 3 5 8 13 21].differences(2)
[1 0 1 1 2 3]
```

First differences are constant for a linear function:

```
>>> let l = 0:10.collect { :i |
>>> 	3 * i + 6
>>> };
>>> let d = l.differences;
>>> (l, d)
(
	[6 9 12 15 18 21 24 27 30 33 36],
	[3 3 3 3 3 3 3 3 3 3]
)
```

Second differences are constant for a quadratic function:

```
>>> let a = 0:10.collect { :i |
>>> 	3 * (i ^ 2) + 6
>>> };
>>> let b = a.differences(1);
>>> let c = a.differences(2);
>>> (a, b, c)
(
	[6 9 18 33 54 81 114 153 198 249 306],
	[3 9 15 21 27 33 39 45 51 57],
	[6 6 6 6 6 6 6 6 6]
)
```

Deduce the degree of a sequence by seeing when successive differences become constant:

```
>>> let l = 1:8.collect { :n |
>>> 	n ^ 5 + (2 * n) - 1
>>> };
>>> differences:/1.nestList(l, 2)
[
	2 35 248 1031 3134 7787 16820 32783;
	33 213 783 2103 4653 9033 15963;
	180 570 1320 2550 4380 6930
]
```

The differences of a `prefixSum`:

```
>>> 1:10.prefixSum.differences
[2 3 4 5 6 7 8 9 10]
```

At a 2×4 matrix answers a 1×4 matrix:

```
>>> [1 3 6 10; 0 5 6 8].differences
[[-1 2 0 -2]]
```

Create a 3×3 matrix,
then compute the first difference between the rows,
a 2×3 matrix:

```
>>> [1 1 1; 5 5 5; 25 25 25].differences
[4 4 4; 20 20 20]
```

Compute the second-order difference between the elements of a vector:

```
>>> [0 5 15 30 50 75 105]
>>> .differences(2)
[5 5 5 5 5]
```

Compute the first-order difference between the columns of a 3×3 matrix:

```
>>> [
>>> 	1   3  5;
>>> 	7  11 13;
>>> 	17 19 23
>>> ].transposed.differences.transposed
[
	2 2;
	4 2;
	2 4
]
```

Relation to `convolve`:

```
>>> [1 .. 9].differences
[1 1 1 1 1 1 1 1]

>>> [1 -1].convolve([1 .. 9])
[1 1 1 1 1 1 1 1 1 -9]
```

Successive differences are progressively shorter:

```
>>> 1:9.collect { :n |
>>> 	1:10.differences(n)
>>> }
[
	1 1 1 1 1 1 1 1 1;
	0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0;
	0 0 0 0 0;
	0 0 0 0;
	0 0 0;
	0 0;
	0
]
```

A pattern resembling Pascal’s triangle:

```
>>> let x = [1].arrayPad([9 9], 0);
>>> differences:/1.nestList(x, 10)
[
	0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 -2 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 1 -3 3 -1 0 0 0 0 0 0;
	0 0 0 0 0 1 -4 6 -4 1 0 0 0 0 0;
	0 0 0 0 1 -5 10 -10 5 -1 0 0 0 0;
	0 0 0 1 -6 15 -20 15 -6 1 0 0 0;
	0 0 1 -7 21 -35 35 -21 7 -1 0 0;
	0 1 -8 28 -56 70 -56 28 -8 1 0;
	1 -9 36 -84 126 -126 84 -36 9 -1;
	-10 45 -120 210 -252 210 -120 45 -10
]
```

Successive differences modulo two of a sequence based on the primes:

~~~spl svg=A
let k = 20;
let m = differences:/1.nestList(
	k.primesList - 1 / 2,
	k
).collect { :each |
	each.padLeft([k], 0)
};
(m % 2).matrixPlot
~~~

![](sw/spl/Help/Image/differences-A.svg)

Differentiate a sampled sine signal:

~~~spl svg=B
let dx = 0.1;
let x = [0, dx .. 4.pi];
let y = x.sin;
[y, y.differences / dx].linePlot
~~~

![](sw/spl/Help/Image/differences-B.svg)

* * *

See also: -, accumulate, discreteLaplacian, foldList, gradient, prefixSum, ratios

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonDifference.html)
[2](https://reference.wolfram.com/language/ref/Differences.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.diff.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.diff.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-differentiate),
_W_
[1](https://en.wikipedia.org/wiki/Differentiator)

Categories: Math
