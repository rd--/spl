# irregularTransposition

- _irregularTransposition([l₁, l₂, …])_

The transposition of a list of lists, cycling row as required:

```
>>> [1; 2 3; 4 5 6].irregularTransposition
[
	1 2 4;
	1 3 5;
	1 2 6
]
```

If the matrix is regular this is equal to `transpose`:

```
>>> [3 3].iota.irregularTransposition
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

* * *

See also: transpose
