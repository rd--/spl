# Volume Syntax

Rewrite rule:

- _[p q; r s:; a b; c d:; ...]_ ⟹ _[[[p, q], [r, s]], [[a, b], [c, d]], ...]_

Allows writing volumes (three-dimensional arrays) as [Matrix Syntax] entries separated by _:;_ tokens.

```
>>> [1 2; 3 4:; 5 6; 7 8]
[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
```

Empty fields are allowed, the empty field will be _[]_:

```
>>> [1 2; 3 4:; :;  5 6; 7 8]
[[[1, 2], [3, 4]], [[]], [[5, 6], [7, 8]]]
```
[[]]
Where supported _:;_ is displayed as _↲_.

* * *

See also: [List Syntax], [Matrix Syntax], [Vector Syntax]

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Unicode: U+21B2 ↲ Downwards Arrow With Tip Leftwards

Categories: Syntax
