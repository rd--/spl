# Matrix Syntax

Rewrite rule:

- _[p q ...; r s ...; ...]_ ⟹ _[[p, q ...], [r, s ...], ...]_

Allows writing _matrices_, two dimensional arrays, as a sequence of _vectors_ separated by semicolons.

A _3×3_ array:

```
>>> [1 2 3; 4 5 6; 7 8 9]
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

This notation can be used to write irregular arrays:

```
>>> [1; 2 3; 4 5 6]
[[1], [2, 3], [4, 5, 6]]
```

Empty fields are allowed, both at the start, and at the end, and in the middle:

```
>>> [; 2 3; ; 5 6; ]
[[], [2, 3], [], [5, 6], []]
```

The `powerSet` help file includes examples of this notation.

* * *

See also: List Syntax, Vector Syntax, Volume Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Categories: Syntax
