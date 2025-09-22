# Residue

- _Residue(n, m)_

A `Residue` is a `Type` holding an `Integer` and a constant modulus.

There is a literal syntax for residues, _nZm_:

```
>>> 3Z5
Residue(3, 5)
```

`commonResidue` and `modulus` answer the components of a `Residue`:

```
>>> (3Z5.commonResidue, 3Z5.modulus)
(3, 5)
```

`asResidue` at a two-element `Sequence` answers a `Residue`:

```
>>> [3 5].asResidue
3Z5
```

The literal syntax allows non-common residue values at the left:

```
>>> 10Z4
2Z4

>>> -1Z4
3Z4
```

Residues support basic arithmetic, `+`, `-`, and `*`:

```
>>> 9Z12 + 5Z12
2Z12

>>> 2Z12 - 5Z12
9Z12

>>> 10Z7 * 11Z7
5Z7
```

`inverse` is the `modularInverse`:

```
>>> 3Z7.inverse
5Z7

>>> 3Z7 * 5Z7
1Z7
```

`/` is implemented in terms of `inverse`:

```
>>> 1Z7 / 3Z7
5Z7

>>> 1Z7 * 3Z7.inverse
5Z7

>>> 2Z7 / 5Z7
6Z7

>>> 5Z7 * 6Z7
2Z7
```

Only `isCoprime` values have an inverse:

```
>>> 6.isCoprime(15)
false

>>> { 6Z15.inverse }.hasError
true
```

The operand may be an integer:

```
>>> 9Z12 + 5
2Z12

>>> 10Z7 * 11
5Z7
```

The operand may be negative:

```
>>> -10Z7 * 11
2Z7

>>> 11Z7 * -10
2Z7
```

A `Residue` may be the operand of an `Integer`:

```
>>> 5 + 9Z12
2Z12

>>> 10 * 11Z7
5Z7
```

or a collection:

```
>>> 9Z12 + [2 5]
[11Z12 2Z12]

>>> [2 5] + 9Z12
[11Z12 2Z12]
```

It is an error if the two modulus are not equal:

```
>>> { 9Z12 + 5Z7 }.hasError
true
```

* * *

See also: %, commonResidue, modularInverse, ResidueSet
