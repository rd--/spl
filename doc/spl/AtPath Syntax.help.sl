# AtPath Syntax

- _c[i; j]_ ≡ _c.at(i).at(j)_
- _c[i; j; k]_ ≡ _c.at(i).at(j).at(k)_
- _c[i; j; k; l...]_ ≡ _c.atPath([i, j, k, l...])_

_Note:_
The matrix and volume special cases are compiled directly, while longer paths construct an Array value and call _atPath_.

* * *

See also: atPath, [Matrix Syntax], [Vector Syntax], [Volume Syntax]
