# padRight

- _padRight(anArray, aList, anObject)_

Answer an array of shape _aList_ by suffixing _anArray_ with copies of _anObject_.

Pad a `List` to make a longer list:

```
>>> [1 2 3].padRight([9], 0)
[1 2 3 0 0 0 0 0 0]
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

* * *

See also: #, ++, arrayPad, padLeft, padLeftAndRight, recycle, reshape, shape, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadRight.html)
