# binaryExponents

- _binaryExponents(n)_

Answer the zero-indexed positions at which the binary expansion of _n_ has a one.

Relation to `binaryExpansion`, `^` and `sum`:

```
>>> 7.binaryExpansion
[1 1 1]

>>> 7.binaryExponents
[0 1 2]

>>> (2 ^ [0 1 2]).sum
7

>>> 43.binaryExpansion
[1 0 1 0 1 1]

>>> 43.binaryExponents
[0 1 3 5]

>>> (2 ^ [0 1 3 5]).sum
43
```

The size of the vector is the binary weight, also called the Hamming weight:

```
>>> 7.binaryExponents
[0 1 1]

>>> 7.hammingWeight
3

>>> 43.binaryExponents
[0 1 3 5]

>>> 43.hammingWeight
4
```

* * *

See also: binaryExpansion, bitAt, bitLength

Guides: Bitwise Functions
