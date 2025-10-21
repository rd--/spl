# ResidueSet

- _ResidueSet(c, m)_

Answer an `ResidueSet` with the items of the collection _c_, taken modulus _m_.
A `ResidueSet` is a `Type` holding a `IdentitySet` of common residues of a `modulus`.

`leastResidueSystem` answers a complete `ResidueSet`:

```
>>> 4.leastResidueSystem
ResidueSet([0 1 2 3], 4)
```

Construct a `ResidueSet` from a `Collection` and a modulus:

```
>>> ResidueSet(
>>> 	[0 5 10 15 20 25 30 35],
>>> 	4
>>> )
4.leastResidueSystem
```

`ResidueSet` implements `size`, `modulus` and `asList`:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let s = ResidueSet(l, 12);
>>> (s.size, s.modulus, s.asList)
(7, 12, [0 2 4 5 7 9 11])
```

A `ResidueSet` has a `complement`:

```
>>> ResidueSet([0 2 4 5 7 9 11], 12)
>>> .complement
ResidueSet([1 3 6 8 10], 12)
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
ResidueSet([1 3 5], 6)
```

`ResidueSet` implements `Collection`

```
>>> 4.leastResidueSystem
>>> .powerSet
>>> .size
16
```

`asBitString` answers a `String` of `modulus` places,
indicating the presence of entries in the set:

```
>>> ResidueSet([0 2 4 5 7 9 11], 12)
>>> .asBitString
'101011010101'

>>> ResidueSet([0 2 4 5 7 9 11], 12)
>>> .complement
>>> .asBitString
'010100101010'

>>> ResidueSet([0 2 3 5 7 8 10], 12)
>>> .asBitString
'101101011010'
```

`ResidueSet` implements the arithmetic operators `+`, `-` and `*`:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let s = ResidueSet(l, 12);
>>> (
>>> 	l + 6,
>>> 	l + 6 % 12,
>>> 	s + 6,
>>> 	l - 1,
>>> 	l - 1 % 12,
>>> 	s - 1,
>>> 	l * 7 + 1,
>>> 	l * 7 + 1 % 12,
>>> 	s * 7 + 1
>>> )
(
	[6 8 10 11 13 15 17],
	[6 8 10 11 1 3 5],
	ResidueSet([1 3 5 6 8 10 11], 12),
	[-1 1 3 4 6 8 10],
	[11 1 3 4 6 8 10],
	ResidueSet([1 3 4 6 8 10 11], 12),
	[1 15 29 36 50 64 78],
	[1 3 5 0 2 4 6],
	ResidueSet([0 1 2 3 4 5 6], 12)
)
```

* * *

See also: commonResidue, IdentitySet, leastResidueSystem, Residue, Set

Gudies: Set Functions
