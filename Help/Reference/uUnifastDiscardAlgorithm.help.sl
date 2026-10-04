# uUnifastDiscardAlgorithm

- _uUnifastDiscardAlgorithm(r, n, u, m)_

Answer a `List` of _m_ places,
where each is an _n_-vector of random real number that sum to _u_.

```
>>> let r = Sfc32(781934);
>>> let x = r.uUnifastDiscardAlgorithm(3, 1, 4);
>>> (x, x.collect(sum/1))
(
	[
		0.25752 0.14379 0.59868;
		0.58693 0.13610 0.27697;
		0.24790 0.30851 0.44359;
		0.13786 0.72729 0.13485
	],
	[1 1 1 1]
)
```

A 13×7 matrix, rows sum to one half:

~~~spl svg=A
Sfc32(361782)
.uUnifastDiscardAlgorithm(7, 0.5, 13)
.matrixPlot
~~~

![](Help/Image/uUnifastDiscardAlgorithm-A.svg)

* * *

See also: katoYamasakiAlgorithm, staffordsAlgorithm, uUnifastAlgorithm

Guides: Random Functions
