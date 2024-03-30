# intervalMatrix

- _intervalMatrix(aTuning)_

Answer an interval matrix representing all possible intervals in _aTuning_.

```
>>> let r = [1/1 9/8 5/4 3/2 5/3].asRatioTuning;
>>> r.intervalMatrix
[
	1/1 9/8 5/4 3/2 5/3;
	1/1 10/9 4/3 40/27 16/9;
	1/1 6/5 4/3 8/5 9/5;
	1/1 10/9 4/3 3/2 5/3;
	1/1 6/5 27/20 3/2 9/5
]
```

This is similar to, but distinct from, the usual distance matrix given by:

```
>>> let r = [1/1 9/8 5/4 3/2 5/3];
>>> /.swap.table(r, r)
[
	1/1 9/8 5/4 3/2 5/3;
	8/9 1/1 10/9 4/3 40/27;
	4/5 9/10 1/1 6/5 4/3;
	2/3 3/4 5/6 1/1 10/9;
	3/5 27/40 3/4 9/10 1/1
]
```

* * *

See also: /, RatioTuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_matrix)
