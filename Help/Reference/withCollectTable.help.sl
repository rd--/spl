# withCollectTable

- _withCollectTable(u, v)_

Given vectors _u_ & _v_ generates the table _[u1v, u2v ...]_.

```
>>> [10 20 30 40 50].withCollectTable(
>>> 	[1 2 3],
>>> 	+
>>> )
[
	11 12 13;
	21 22 23;
	31 32 33;
	41 42 43;
	51 52 53
]

>>> [10 20 30 40 50] +.t [1 2 3]
[
	11 12 13;
	21 22 23;
	31 32 33;
	41 42 43;
	51 52 53
]
```

At matrices:

```
>>> let x = [4 4.5];
>>> let y = [2 3 5 6];
>>> let z = [x y];
>>> z.withCollectTable(z, *)
[
	16 18;
	9 13.5 22.5 27
	:;
	8 9;
	6 9 15 18;
	20 22.5;
	12 18 30 36
]
```

Written out:

```
>>> let x = [4 4.5];
>>> let y = [2 3 5 6];
>>> let z = [x y];
>>> [x * z, y * z]
[
	16 18;
	9 13.5 22.5 27
	:;
	8 9;
	6 9 15 18;
	20 22.5;
	12 18 30 36
]
```

* * *

See also: withCollectCrossed

Categories: Arithmetic
