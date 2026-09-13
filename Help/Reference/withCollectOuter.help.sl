# withCollectOuter

Given vectors _u_ & _v_ generates the table _[u₁v₁ u₁v₂ …; u₂v₁ u₂v₂ …; …]_,
which can calculate the _outer product_ (⊗) of two vectors.

```
>>> [10 20 30 40 50].withCollectOuter([1 2 3], +)
[11 12 13; 21 22 23; 31 32 33; 41 42 43; 51 52 53]

>>> [10 20 30 40 50] +.t [1 2 3]
[11 12 13; 21 22 23; 31 32 33; 41 42 43; 51 52 53]
```

The behaviour when each side is a matrix is quite subtle.

```
>>> let x = [4 4.5];
>>> let y = [2 3 5 6];
>>> let z = [x y];
>>> z.withCollectOuter(z, *)
[
	16 20.25;
	8 13.5 20 27
	:;
	8 13.5 20 27;
	4 9 25 36
]
```

Written out:

```
>>> let x = [4 4.5];
>>> let y = [2 3 5 6];
>>> let z = [x y];
>>> [[x * x, x * y], [y * x, y * y]]
[
	16 20.25;
	8 13.5 20 27
	:;
	8 13.5 20 27;
	4 9 25 36
]
```

* * *

See also: withCollectCrossed

Categories: Arithmetic
