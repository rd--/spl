# nextRandomFloat

- _nextRandomFloat(aRandom | aSystem, lowerBound, upperBound)_
- _nextRandomFloat(alpha)_ => _nextRandomFloat(alpha, 0, 1)_

Answer the next random number at a random number generator, or at the system random number generator.
The answer will be between _lowerBound_ (inclusive) and _upperBound_ (exclusive).

```
>>> Sfc32(12345).nextRandomFloat(3, 9)
7.80664
```

If the lower and upper bounds are elided, they are set to `zero` and `one`.

```
>>> Sfc32(54321).nextRandomFloat
0.02639
```

Uniform distribution:

~~~
({ system.nextRandomFloat(-1, 1) } ! 99).plot
~~~

* * *

See also: randomFloat, Random
