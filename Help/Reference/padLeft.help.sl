# padLeft

- _padLeft(anArray, aList, anObject)_

Answer an array of shape _aLength_ by prefixing _anArray_ with copies of _anObject_.

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

At `String`:

```
>>> 'xyz'.padLeft([9], ' ')
'      xyz'
```

* * *

See also: #, ++, padLeftAndRight, padRight, reshape, recycle, shape, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadLeft.html)
