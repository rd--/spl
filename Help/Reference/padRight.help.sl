# padRight

- _padRight(a, ⍴, x)_

Answer an array of shape _⍴_ by suffixing the array _a_ with copies of the object _x_.

Pad a `List` to make a longer list:

```
>>> [1 2 3].padRight([9], 0)
[1 2 3 0 0 0 0 0 0]
```

Unit list:

```
>>> [5].padRight([5], 1)
[5 1 1 1 1]
```

Zero shape:

```
>>> [0].padRight([0], 1)
[]
```

Not in place:

```
>>> let a = [1 2 3];
>>> let b = a.padRight([5], 0);
>>> (a, b)
([1 2 3], [1 2 3 0 0])
```

Pad matrix to specified shape:

```
>>> [1 2 3; 4 5; 6].padRight([3 3], 0)
[1 2 3; 4 5 0; 6 0 0]
```

Pad to make a 3×4 array:

```
>>> [1 2; 3].padRight([3 4], 0)
[
	1 2 0 0;
	3 0 0 0;
	0 0 0 0
]
```

Pad volume to specified shape:

```
>>> [1; ; 2 3:; 4; 5; ].padRight([2 3 2], 0)
[1 0;0 0; 2 3:; 4 0; 5 0; 0 0]
```

Pad to make a regular matrix:

```
>>> [1 2 3; 4 5; 6].padRight
[
	1 2 3;
	4 5 0;
	6 0 0
]

>>> [1; 2 3; 4 5 6].padRight
[
	1 0 0;
	2 3 0;
	4 5 6
]
```

Pad to make a regular volume:

```
>>> [1; ; 2 3:; 4; 5; ].padRight
[
	1 0;
	0 0;
	2 3
	:;
	4 0;
	5 0;
	0 0
]
```

At `String`:

```
>>> 'xyz'.padRight([9], ' ')
'xyz      '
```

The characteristic function of _{0}_,
OEIS [A000007](https://oeis.org/A000007):

```
>>> [1].padRight([19], 0)
[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Weight array of the natural numbers,
OEIS [A144112](https://oeis.org/A144112):

~~~spl svg=A
0:15.collect { :n |
	[n].padRight([n], 1) ++ [n + 1]
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/padRight-A.svg)

Plot the Fredholm-Rueppel sequence,
OEIS [A036987](https://oeis.org/A036987):

~~~spl svg=B
0:6.collect { :k |
	[1].padRight([2 ^ k], 0)
}.catenate.prefixSum

discretePlot
~~~

![](sw/spl/Help/Image/padRight-B.svg)

* * *

See also: #, ++, arrayPad, padLeft, padLeftAndRight, recycle, reshape, shape, size

Guides: Array Functions, List Functions, Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadRight.html),
_OEIS_
[1](https://oeis.org/A144112)
