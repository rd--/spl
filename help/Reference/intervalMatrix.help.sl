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

* * *

See also: /, RatioTuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_matrix)
