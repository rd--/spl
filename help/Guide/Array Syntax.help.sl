# Array Syntax

A notation for writing literal vectors, matrices and volumes.

A _vector_, a one-dimensional array, can be written as a sequence of literals:

```
>>> [1 3 5 7 9]
[1, 3, 5, 7, 9]
```

A _matrix_, a two-dimensional array, can be written as a sequence of vectors separated by semicolons:

```
>>> [1 2; 3 4; 5 6]
[[1, 2], [3, 4], [5, 6]]
```

A _volume_, a three-dimensional array, can be written as a sequence of matrices separated by _:;_ tokens:

```
>>> [1 2; 3 4:; 5 6; 7 8]
[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
```

The notations allow for writing irregular arrays,
see the individual entries below for details.

_Rationale:_
Spl is primarily used for writing music.
Having a convenient notation for writing literal vectors, trees, and matrices is particularly important in this context.
A concise notation can allow the _score_ for a work to be written directly in Spl.

* * *

See also: List, [List Syntax], [Matrix Syntax], [Tree Syntax], [Vector Syntax], [Volume Syntax]

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Categories: Syntax
