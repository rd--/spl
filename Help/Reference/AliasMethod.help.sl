# AliasMethod

- _AliasMethod(aList)_

A `Type` that implements the alias method of sampling from a discrete probability distribution.
Implements the `RandomProcess` trait.
The distribution is given as a sequence of probability values that `sum` to `one`.

```
>>> let w = [0.25 0.3 0.1 0.2 0.15];
>>> let m = AliasMethod(w);
>>> let r = Sfc32(1372);
>>> let d = { m.nextRandom(r) } ! 1000;
>>> let a = d.asIdentityMultiset.sortedElements;
>>> (->.map(1:5, w * 1000), a)
(
	[
		1 -> 250,
		2 -> 300,
		3 -> 100,
		4 -> 200,
		5 -> 150
	],
	[
		1 -> 232,
		2 -> 329,
		3 ->  93,
		4 -> 199,
		5 -> 147
	]
)
```

* * *

See also: Random, randomWeightedChoice, Sfc32

References:
_W_
[1](https://en.wikipedia.org/wiki/Alias_method)

Further Reading: Walker 1974, Vose 1991

Categories: Random
