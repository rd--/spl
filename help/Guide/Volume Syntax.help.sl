# Volume Syntax

Rewrite rule:

- _[p q; r s:; a b; c d:; ...]_ ⟹ _[[[p, q], [r, s]], [[a, b], [c, d]], ...]_

Allows writing _volumes_, three-dimensional arrays, as _matrices_ separated by _:;_ tokens.

A _2×2×2_ array:

```
>>> [1 2; 3 4:; 5 6; 7 8]
[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
```

A _4×3×2_ array:

```
>>> let v = [1 2; 3 4; 5 6:; 7 8; 9 1; 2 3:; 4 5; 6 7; 8 9:; 1 2; 3 4; 5 6];
>>> (v.shape, v)
([4,3,2],[[[1,2],[3,4],[5,6]],[[7,8],[9,1],[2,3]],[[4,5],[6,7],[8,9]],[[1,2],[3,4],[5,6]]])
```

Empty fields are allowed.
The empty field will be _[[]]_, an empty matrix, not an empty vector:

```
>>> [1 2; 3 4:; :; 5 6; 7 8]
[[[1, 2], [3, 4]], [[]], [[5, 6], [7, 8]]]
```

Where supported, _:;_ is displayed as _↲_.
This suggests the Apl notation where matrices are separated by empty lines.

* * *

See also: Array Syntax, List Syntax, Matrix Syntax, Vector Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Unicode: U+21B2 ↲ Downwards Arrow With Tip Leftwards

Categories: Syntax
