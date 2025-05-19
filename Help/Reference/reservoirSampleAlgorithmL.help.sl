# reservoirSampleAlgorithmL

- _reservoirSampleAlgorithmL(r, s, k)_

Reservoir sampling is a family of randomized algorithms for choosing a simple random sample,
without replacement,
of _k_ items from a population of _s_ of unknown size _n_ in a single pass over the items.

Select _23_ items from _1-99_:

```
>>> Sfc32(367214)
>>> .reservoirSampleAlgorithmL([1 .. 99], 23)
[
	37  2 39 96 29  6  7  8 58 44
	99 12 78 86 54 92 60 98 19 55
	57 65 40
]
```

Calculate the `mean` and `standardDeviation` for a sample of 300 items from the reservoir _1-999_:

```
>>> let r = Sfc32(812947);
>>> let x = r.reservoirSampleAlgorithmL(
>>> 	[1 .. 999],
>>> 	300
>>> );
>>> (x.mean, x.standardDeviation)
(496.69, 291.92)
```

* * *

See also: randomSample

References:
_W_
[1](https://en.wikipedia.org/wiki/Reservoir_sampling)

Further Reading: Li 1994
