# Vector Syntax

Rewrite rule:

- _[p q r ...]_ ⟹ _[p, q, r, ...]_

Allows writing lists where items are either literals or identifiers or _Vector Syntax_ without comma separators.

Literal items:

```
>>> [1 2 3 4 5 6 7 8 9]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

Identifier items:

```
>>> let x = 1;
>>> let z = 3;
>>> [x 2 z]
[1, 2, 3]
```

Vector syntax with vector items has been disallowed.
This syntax is nice for writing tree structures.

```
[1 [1 3 [1 3 5] 5] 5] = [1, [1, 3, [1, 3, 5], 5], 5]
```

* * *

See also: [List Syntax], [Matrix Syntax], [Volume Syntax]

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Categories: Syntax
