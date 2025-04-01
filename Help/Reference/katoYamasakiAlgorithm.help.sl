# katoYamasakiAlgorithm

- _katoYamasakiAlgorithm(r, [u⌊ u⌈ uΣ], m)_

Answer _m_ lists of vectors that sum to _uΣ_,
and where each value is in _(u⌊, u⌈)_.
The size of each vector is not fixed.

```
>>> let r = Sfc32(561374);
>>> let c = r.katoYamasakiAlgorithm([0 1 1], 3);
>>> (c, c.collect(sum:/1))
(
	[
		0.34824 0.12969 0.32795 0.19413;
		0.67521 0.32479;
		0.86186 0.13814
	],
	[1 1 1]
)
```

With non-unit minima and maxima:

```
>>> let r = Sfc32(316842);
>>> let c = r.katoYamasakiAlgorithm([0.2 0.7 1], 3);
>>> (c, c.collect(sum:/1))
(
	[
		0.32542 0.29646 0.37812;
		0.45639 0.24399 0.29962;
		0.40322 0.59527 0.0015267
	],
	[1 1 1]
)
```

* * *

See also: staffordsAlgorithm, uUnifastAlgorithm, uUnifastDiscardAlgorithm

Further Reading: Kato & Yamasakial 2008
