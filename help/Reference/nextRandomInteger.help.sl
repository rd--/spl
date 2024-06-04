# nextRandomInteger

- _nextRandomInteger(aRandomNumberGenerator, min, max)_

Answer the next random integer at _aRandomNumberGenerator_.
The answer will be between _min_ (inclusive) and _max_ (inclusive).

```
>>> Sfc32(54321).nextRandomInteger(1, 9)
1

>>> Sfc32(12345).nextRandomInteger(-9, 9)
6
```

Answer the next thirteen random integers between one and nine:

```
>>> let r = Sfc32(29315);
>>> { r.nextRandomInteger(1, 9) } ! 13
[5 2 4 7 3 9 6 2 7 6 3 1 3]
```

Plot uniform distribution:

~~~
({ system.nextRandomInteger(1, 99) } ! 99).plot
~~~

* * *

See also: nextRandomFloat, randomInteger, RandomNumberGenerator
