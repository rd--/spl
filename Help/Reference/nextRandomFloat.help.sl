# nextRandomFloat

- _nextRandomFloat(r, min=0, max=1)_

Answer the next random number at the random number generator _r_.
The answer will be between _min_ (inclusive) and _max_ (exclusive).

```
>>> Sfc32(54321)
>>> .nextRandomFloat(0, 1)
0.02639
```

If these are omitted the answer is between `zero` and `one`.

```
>>> Sfc32(54321)
>>> .nextRandomFloat
0.02639
```

Equivalent scaling using `*` and `+`:

```
>>> Sfc32(12345)
>>> .nextRandomFloat(3, 9)
7.80664

>>> Sfc32(12345)
>>> .nextRandomFloat * 6 + 3
7.80664
```

Answer the next thirteen random numbers scaled to lie between one and nine as integers:

```
>>> let r = Sfc32(29315);
>>> {
>>> 	(r.nextRandomFloat * 8 + 1)
>>> 	.ceiling
>>> } ! 13
[6 3 4 8 4 9 7 3 7 6 4 2 3]
```

Plot uniform distribution:

~~~spl svg=A
let rng = Sfc32(698412);
(
	{
		rng.nextRandomFloat(-1, 1)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/nextRandomFloat-A.svg)

* * *

See also: nextRandomInteger, RandomNumberGenerator, randomReal

Guides: Random Number Generators

Categories: Random
