# padLeft

- _padLeft(a, ⍴, x)_

Answer an array of shape _⍴_ by prefixing the array _a_ with copies of the object _x_.

Pad a `List` to make a longer list:

```
>>> [1 2 3].padLeft([9], 0)
[0 0 0 0 0 0 1 2 3]
```

Not in place:

```
>>> let a = [1 2 3];
>>> let b = a.padLeft([5], 0);
>>> (a, b)
([1 2 3], [0 0 1 2 3])
```

Pad matrix to specified shape:

```
>>> [1 2 3; 4 5; 6].padLeft([3 3], 0)
[1 2 3; 0 4 5; 0 0 6]
```

Pad to make a 3×4 array:

```
>>> [1 2; 3].padLeft([3 4], 0)
[
	0 0 0 0;
	0 0 1 2;
	0 0 0 3
]
```

Pad volume to specified shape:

```
>>> [1; ; 2 3:; 4; 5; ].padLeft([2 3 2], 0)
[0 1;0 0; 2 3:; 0 4; 0 5; 0 0]
```

Pad to make a regular matrix:

```
>>> [1 2 3; 4 5; 6].padLeft
[
	1 2 3;
	0 4 5;
	0 0 6
]
```

Pad to make a regular volume:

```
>>> [1; ; 2 3:; 4; 5; ].padLeft
[
	0 1;
	0 0;
	2 3
	:;
	0 4;
	0 5;
	0 0
]
```

Contract:

```
>>> [0 1].padLeft([1], 0)
[0]
```

At `String`:

```
>>> 'xyz'.padLeft([9], ' ')
'      xyz'
```

Prepend three rows to a row-vector:

```
>>> [[1 2 3 4]].padLeft([4 4], 9)
[
	9 9 9 9;
	9 9 9 9;
	9 9 9 9;
	1 2 3 4
]
```

An accumulation array,
OEIS [A051340](https://oeis.org/A051340):

~~~spl svg=A
1:15.collect { :n |
	[n].padLeft([n], 1)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/padLeft-A.svg)

Infinitesimal Pascal matrix,
OEIS [A132440](https://oeis.org/A132440):

~~~spl svg=B
0:15.collect { :n |
	[n 0].padLeft([n + 1], 0)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/padLeft-B.svg)

* * *

See also: #, ++, arrayPad, padLeftAndRight, padRight, reshape, recycle, shape, size

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadLeft.html),
_OEIS_
[1](https://oeis.org/A051340)
