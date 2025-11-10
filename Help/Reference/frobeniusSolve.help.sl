# frobeniusSolve

- _frobeniusSolve(a, b)_

Answer a list of all solutions of the Frobenius equation specified by the coefficients _a_ and the sum _b_.

The two solutions of the Frobenius equation _6x + 9y + 20z = 24_:

```
>>> let a = [6 9 20];
>>> let b = 24;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
([1 2 0; 4 0 0], x.size # [b])
```

The eight solutions of the Frobenius equation _12x + 16y + 20z + 27t = 123_:

```
>>> let a = [12 16 20 27];
>>> let b = 123;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
(
	[
		0 1 4 1;
		0 6 0 1;
		1 4 1 1;
		2 2 2 1;
		3 0 3 1;
		4 3 0 1;
		5 1 1 1;
		8 0 0 1
	],
	x.size # [b]
)
```

Show that 43 cannot be represented as a sum of positive integer multiples of 6, 9 and 20:

```
>>> [6 9 20].frobeniusSolve(43)
[]
```

Find all such representations of 44:

```
>>> let a = [6 9 20];
>>> let b = 44;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
([1 2 1; 4 0 1], [b b])
```

The twenty-one solutions of the Frobenius equation _5x + 8y + 9z + 12t = 67_:

```
>>> let a = [5 8 9 12];
>>> let b = 67;
>>> let x = a.frobeniusSolve(b);
>>> (x, x.dot(a))
(
	[
		0 2 3 2;
		0 5 3 0;
		1 1 2 3;
		1 1 6 0;
		1 4 2 1;
		2 0 1 4;
		2 0 5 1;
		2 3 1 2;
		2 6 1 0;
		3 2 0 3;
		3 2 4 0;
		3 5 0 1;
		4 1 3 1;
		5 0 2 2;
		5 3 2 0;
		6 2 1 1;
		7 1 0 2;
		7 4 0 0;
		8 0 3 0;
		10 1 1 0;
		11 0 0 1
	],
	x.size # [b]
)
```

* * *

See also: bockerLiptakAlgorithm, extendedGcd, frobeniusNumber, numberDecompose

Guides: Combinatorial Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FrobeniusEquation.html)
[2](https://reference.wolfram.com/language/ref/FrobeniusSolve.html)
