# randomBit

- _randomBit(r, p, shape)_

Answer either `zero` or `one` at random, with probablity _p_, in array of indicated _shape_.

A random 3×9 matrix of bits, with equal probablity of being `zero` or `one`:

```
>>> let rng = Sfc32(2166136261);
>>> rng.randomBit(0.5, [3 9])
[
	1 1 0 0 0 0 0 1 1;
	0 0 1 0 0 0 0 0 1;
	0 0 0 1 0 0 1 0 1
]
```

The same array using `seedRandom` to set the system random number generator:

```
>>> 2166136261.seedRandom;
>>> system.randomBit(0.5, [3 9])
[
	1 1 0 0 0 0 0 1 1;
	0 0 1 0 0 0 0 0 1;
	0 0 0 1 0 0 1 0 1
]
```

A `matrixPlot` of a 13×11 matrix where each cell has a 10% probablity of being `one`,
or equally a 90% chance of being `zero`:

```
Sfc32(67814)
.randomBit(0.1, [13 11])
.matrixPlot
```

![](sw/spl/Help/Image/randomBit-A.svg)

A `Bitmap` of a 50×90 matrix where each cell has a 33% probablity of being `one`,
or equally a 66% chance of being `zero`:

```
Sfc32(701459)
.randomBit(0.33, [50 90])
.Bitmap
```

![](sw/spl/Help/Image/randomBit-B.png)

* * *

See also: atRandom, randomComplex, randomInteger, randomReal, seedRandom

Categories: Random
