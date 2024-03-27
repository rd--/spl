# asResidueSet

- _asResidueSet(aBitSet | aString)_
- _asResidueSet(aCollection, anInteger)_

The binary form answers a `ResidueSet` including a _aCollection_ and having modulus _anInteger_.

```
>>> [0 5 10 15 20 25 30 35].asResidueSet(4).asList
[0 1 2 3]
```

The unary form infers the modulus, i.e. at `String`:

```
>>> '101011010101'.asResidueSet
[0 2 4 5 7 9 11].asResidueSet(12)
```

* * *

See also: asList, ResidueSet

Categories: Converting
