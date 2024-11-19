# intervalMatrix

- _intervalMatrix(aTuning)_

Answer an interval matrix representing all possible intervals in _aTuning_.

Interval matrix of a five-tone five-limit tuning:

```
>>> let r = [1/1 9/8 5/4 3/2 5/3].asRatioTuning;
>>> r.intervalMatrix
[
	1/1  9/8  5/4  3/2   5/3;
	1/1 10/9  4/3 40/27 16/9;
	1/1  6/5  4/3  8/5   9/5;
	1/1 10/9  4/3  3/2   5/3;
	1/1  6/5 27/20 3/2   9/5
]
```

Interval matrix of a seven-tone five-limit tuning:

```
>>> [1/1 9/8 5/4 4/3 3/2 5/3 15/8].asJiTuning.intervalMatrix
[
	1/1  9/8  5/4  4/3  3/2  5/3  15/8;
	1/1 10/9 32/27 4/3 40/27 5/3  16/9;
	1/1 16/15 6/5  4/3  3/2  8/5   9/5;
	1/1  9/8  5/4 45/32 3/2 27/16 15/8;
	1/1 10/9  5/4  4/3  3/2  5/3  16/9;
	1/1  9/8  6/5 27/20 3/2  8/5   9/5;
	1/1 16/15 6/5  4/3 64/45 8/5  16/9
]
```

This is similar to, but distinct from, the matrix given by `distanceMatrix`:

```
>>> let r = [1/1 9/8 5/4 3/2 5/3];
>>> r.distanceMatrix(r) { :i :j |
>>> 	(j / i).octaveReduced
>>> }
[
	1/1 9/8 5/4 3/2 5/3;
	16/9 1/1 10/9 4/3 40/27;
	8/5 9/5 1/1 6/5 4/3;
	4/3 3/2 5/3 1/1 10/9;
	6/5 27/20 3/2 9/5 1/1
]
```

* * *

See also: /, distanceMatrix, isConstantStructure, RatioTuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_matrix)

Categories: Tuning, Matrix
