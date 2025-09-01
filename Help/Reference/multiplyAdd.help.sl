# multiplyAdd

- _multiplyAdd(i, j, k)_

Answer _i*j+k_.

```
>>> 3.multiplyAdd(4, 5)
3 * 4 + 5
```

Threads over lists:

```
>>> [1 2 3].multiplyAdd([4 5 6], [7 8 9])
[
	1 * 4 + 7,
	2 * 5 + 8,
	3 * 6 + 9
]

>>> [1 2 3] * [4 5 6] + [7 8 9]
[11 18 27]
```

* * *

See also: *, +
