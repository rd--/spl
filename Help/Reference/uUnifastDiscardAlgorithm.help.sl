# uUnifastDiscardAlgorithm

- _uUnifastDiscardAlgorithm(r, n, u, m)_

Answer a `List` of _m_ places,
where each is an _n_-vector of random real number that sum to _u_.

```
>>> let r = Sfc32(781934);
>>> let x = r.uUnifastDiscardAlgorithm(3, 1, 4);
>>> (x, x.collect(sum:/1))
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

* * *

See also: katoYamasakiAlgorithm, staffordsAlgorithm, uUnifastAlgorithm
