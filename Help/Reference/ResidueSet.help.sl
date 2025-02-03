# ResidueSet

- _ResidueSet(anInteger)_

Answer an empty `ResidueSet` with modulus _anInteger_.
A `ResidueSet` is a `Type` holding a `IdentitySet` of common residues of a `modulus`.

`leastResidueSystem` answers a complete `ResidueSet`:

```
>>> 4.leastResidueSystem
[0 1 2 3].asResidueSet(4)
```

`asResidueSet` constructs a `ResidueSet` from a `Collection` and a modulus:

```
>>> [0 5 10 15 20 25 30 35]
>>> .asResidueSet(4)
4.leastResidueSystem
```

`ResidueSet` implements `size`, `modulus` and `asList`:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let s = l.asResidueSet(12);
>>> (s.size, s.modulus, s.asList)
(7, 12, [0 2 4 5 7 9 11])
```

A `ResidueSet` has a `complement`:

```
>>> [0 2 4 5 7 9 11]
>>> .asResidueSet(12)
>>> .complement
[1 3 6 8 10].asResidueSet(12)
```

The `complement` of a `leastResidueSystem` is empty:

```
>>> 4.leastResidueSystem
>>> .complement
>>> .isEmpty
true
```

The `species` of a `ResidueSet` constructs a set with the same modulus:

```
>>> 6.leastResidueSystem
>>> .select(isOdd:/1)
[1 3 5].asResidueSet(6)
```

`ResideSet` implements `Collection`

```
>>> 4.leastResidueSystem
>>> .powerSet
>>> .size
16
```

`asBitString` answers a `String` of `modulus` places,
indicating the presence of entries in the set:

```
>>> [0 2 4 5 7 9 11]
>>> .asResidueSet(12)
>>> .asBitString
'101011010101'

>>> [0 2 4 5 7 9 11]
>>> .asResidueSet(12)
>>> .complement
>>> .asBitString
'010100101010'

>>> [0 2 3 5 7 8 10]
>>> .asResidueSet(12)
>>> .asBitString
'101101011010'
```

`ResidueSet` implements the arithmetic operators `+`, `-` and `*`:

```
>>> let s = [0 2 4 5 7 9 11].asResidueSet(12);
>>> (s + 6, s - 1, s * 7 + 1)
(
	[1 3 5 6 8 10 11].asResidueSet(12),
	[1 3 4 6 8 10 11].asResidueSet(12),
	[0 1 2 3 4 5 6].asResidueSet(12)
)
```

* * *

See also: commonResidue, IdentitySet, leastResidueSystem, Residue, Set
