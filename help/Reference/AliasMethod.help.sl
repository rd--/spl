# AliasMethod

- _AliasMethod(aSeqence, aRandom)_

A `Type` that implements the alias method of sampling from a discrete probability distribution.
The distribution is given as a sequence of probability values that `sum` to `one`.

```
>>> let d = [0.25 0.3 0.1 0.2 0.15];
>>> let m = AliasMethod(d, Sfc32(1372));
>>> let r = ({ m.next } ! 1000).asBag.sortedElements;
>>> (->.map(1:5, d * 1000), r)
(
	[1 -> 250, 2 -> 300, 3 -> 100, 4 -> 200, 5 -> 150],
	[1 -> 232, 2 -> 329, 3 ->  93, 4 -> 199, 5 -> 147]
)
```

* * *

See also: Random, Sfc32

References:
_W_
[1](https://en.wikipedia.org/wiki/Alias_method)

Further Reading: Walker 1974, Vose 1991

Categories: Random
