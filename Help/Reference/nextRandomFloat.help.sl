# nextRandomFloat

- _nextRandomFloat(aRandomNumberGenerator, min=0, max=1)_

Answer the next random number at _aRandomNumberGenerator_.
The answer will be between _min_ (inclusive) and _max_ (exclusive).
If these are omitted the answer is between `zero` and `one`.

```
>>> Sfc32(54321).nextRandomFloat
0.02639

>>> Sfc32(12345).nextRandomFloat * 6 + 3
7.80664
```

Answer the next thirteen random numbers scaled to lie between one and nine as integers:

```
>>> let r = Sfc32(29315);
>>> { (r.nextRandomFloat * 8 + 1).ceiling } ! 13
[6 3 4 8 4 9 7 3 7 6 4 2 3]
```

Plot uniform distribution:

~~~
({ system.nextRandomFloat * 2 - 1 } ! 99).linePlot
~~~

* * *

See also: nextRandomInteger, RandomNumberGenerator, randomReal
