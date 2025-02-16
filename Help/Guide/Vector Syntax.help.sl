# Vector Syntax

Rewrite rule:

- _[p q r ...]_ ⟹ _[p, q, r, ...]_

Allows writing lists of literals without comma separators.
A Vector cannot contain other Vectors, see `Matrix Syntax`.

Literal items:

```
>>> [1 2 3 4 5 6 7 8 9]
[1, 2, 3, 4, 5, 6, 7, 8, 9]

>>> [3.141 1.pi 'text' true false]
[3.141, 1.pi, 'text', true, false]
```

Identifier items:

```
>>> let x = 1;
>>> let y = 2;
>>> let z = 3;
>>> [x y z]
[1, 2, 3]
```

Literals and identifiers may be mixed together:

```
>>> let [x, y, z] = 3:5;
>>> [1 2 x y z 6 7 8 9]
[1 2 3 4 5 6 7 8 9]
```

_Note:_
Vector syntax is parsed with a higher priority than `List Syntax`.
While most vector expressions are not valid list expressions,
expressions such as  _[-1 -2 -3]_ are ambiguous.
This expression could be parsed either as the one element list _[-1 - 2 - 3] = [-6]_,
or as the three element vector _[-1 -2 -3]_.
Sᴘʟ parses it as the latter:

```
>>> [-1 -2 -3]
[-1, -2, -3]
```

The ambiguity should be resolved by requiring whitespace around infix operators,
however at present one-element vectors are rewritten as `enclose`,
which is therefore required to be a primitive.

* * *

See also: List

Guides: Array Syntax, List Syntax, Matrix Syntax, Volume Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html)

Categories: Syntax
