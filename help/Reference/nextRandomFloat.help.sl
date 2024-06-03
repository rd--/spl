# nextRandomFloat

- _nextRandomFloat(aRandomNumberGenerator)_

Answer the next random number at a random number generator, or at the system random number generator.
The answer will be between `zero` (inclusive) and `one` (exclusive).

```
>>> Sfc32(12345).nextRandomFloat * 6 + 3
7.80664

>>> Sfc32(54321).nextRandomFloat
0.02639
```

Answer the next five random numbers scaled to lie between one and nine:

```
>>> let r = Sfc32(12345);
>>> { (r.nextRandomFloat * 8 + 1).ceiling } ! 5
[8 5 9 9 4]
```

Plot uniform distribution:

~~~
({ system.nextRandomFloat * 2 - 1 } ! 99).plot
~~~

* * *

See also: randomFloat, Random
