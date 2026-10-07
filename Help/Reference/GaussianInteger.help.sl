# GaussianInteger

- _GaussianInteger(a, b)_

Answer a `Complex` number where _a_ and _b_ are integers.

```
>>> GaussianInteger(1, 2)
1J2
```

Threads over lists:

```
>>> GaussianInteger([1 2], 3)
[1J3 2J3]

>>> GaussianInteger(1, [2 3])
[1J2 1J3]
```

The unary form maps over appropriately shaped arrays:

```
>>> GaussianInteger[1 2]
1J2

>>> GaussianInteger[1 2; 3 4]
[1J2 3J4]

>>> GaussianInteger[1 2; 3 4:; 5 6; 7 8]
[1J3 2J4; 5J7 6J8]
```

* * *

See also: Complex, isGaussianInteger, isGaussianPrime

Guides: Complex Number Functions
